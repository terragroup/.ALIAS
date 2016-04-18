package com.groupemre.atnv2.ihm.client.views.main;

import com.allen_sauer.gwt.log.client.Log;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.HasText;
import com.google.gwt.user.client.ui.IsWidget;
import com.google.inject.Inject;
import com.google.web.bindery.event.shared.EventBus;
import com.groupemre.atnv2.dto.utilisateur.Utilisateur;
import com.groupemre.atnv2.ihm.client.application.event.tabs.tabcontexts.Atnv2TabType;
import com.groupemre.atnv2.ihm.client.application.event.tabs.tabcontexts.StaticTabContext;
import com.groupemre.atnv2.ihm.client.application.services.UtilisateurService;
import com.groupemre.socle.ihm.client.application.SocleUtil;
import com.groupemre.socle.ihm.client.application.events.tabs.CloseTabEvent;
import com.groupemre.socle.ihm.client.application.events.tabs.RequestTabEvent;
import com.groupemre.socle.ihm.client.application.events.tabs.tabContexts.AbstractTabContext;
import com.groupemre.socle.ihm.client.application.mvp.NameTokens;
import com.groupemre.socle.ihm.client.application.services.LogoutService;
import com.groupemre.socle.ihm.client.ui.components.SocleInfo;
import com.groupemre.socle.ihm.client.view.TabPresenter;
import com.gwtplatform.mvp.client.HasUiHandlers;
import com.gwtplatform.mvp.client.Presenter;
import com.gwtplatform.mvp.client.View;
import com.gwtplatform.mvp.client.annotations.NameToken;
import com.gwtplatform.mvp.client.annotations.ProxyCodeSplit;
import com.gwtplatform.mvp.client.annotations.ProxyEvent;
import com.gwtplatform.mvp.client.proxy.PlaceManager;
import com.gwtplatform.mvp.client.proxy.ProxyPlace;
import com.gwtplatform.mvp.client.proxy.RevealRootLayoutContentEvent;
import com.gwtplatform.mvp.shared.proxy.PlaceRequest;
import com.sencha.gxt.widget.core.client.Dialog;
import com.sencha.gxt.widget.core.client.box.ConfirmMessageBox;
import com.sencha.gxt.widget.core.client.event.HideEvent;
import org.fusesource.restygwt.client.Method;
import org.fusesource.restygwt.client.MethodCallback;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static com.google.common.base.Strings.isNullOrEmpty;

public class MainPresenter extends Presenter<MainPresenter.MyView, MainPresenter.MyProxy> implements RequestTabEvent.RequestTabHandler, MainUiHandlers,CloseTabEvent.CloseTabHandler {

  @Inject
  private TabFactory tabFactory;

  /*
   * Chaque AbstractTabContext est identifié par une clé.
   * Cet attribut garde la liste de tous les onglets ouverts indexés par leur clé
   *
   *  Si l'utilisateur demande un onglet déjà ouvert (i.e. sa clé est présente dans la map),
   *  l'onglet concerné devient actif. Sinon, l'onglet est créé puis rendu actif.
   */
  private Map<String, Atnv2Tab> hmOpenedTabs;

  @Inject
  private PlaceManager placeManager;

  @Inject
  private LogoutService logoutService;

  @Inject
  private UtilisateurService utilisateurService;

  @Inject
  private DialogChangePassword dialogChangePassword;

  @Inject
  public MainPresenter(EventBus eventBus, MyView view, MyProxy proxy) {
    super(eventBus, view, proxy);
    this.hmOpenedTabs = new HashMap<String, Atnv2Tab>();
    getView().setUiHandlers(this);
    initClosingHandler();
    addRegisteredHandler(CloseTabEvent.getType(),this);
  }

  @Override
  protected void revealInParent() {
    RevealRootLayoutContentEvent.fire(this, this);

    Utilisateur utilisateur = (Utilisateur) SocleUtil.getUtilisateur();
    if (SocleUtil.getUtilisateur() == null || isNullOrEmpty(((Utilisateur) SocleUtil.getUtilisateur()).getLogin())) {
      placeManager.revealPlace(new PlaceRequest.Builder().nameToken(NameTokens.LOGIN_PAGE).build());
      return;
    }
    checkExpirePassword(utilisateur);

    getView().getLabelUtilisateur().setText(((Utilisateur)SocleUtil.getUtilisateur()).getLogin());
    getView().updateTrees();

    //Demande d'ouverture de l'onglet "Accueil"
    //RequestTabEvent.fire(this, new StaticTabContext(Atnv2TabType.ACCUEIL));

    // bouchonx - ouvre la page souhaitee
    onSelectTab(Atnv2TabType.PDD_LIST);
  }

  private void checkExpirePassword(Utilisateur utilisateur) {
    if (utilisateur.getMotDePasseExpirationDate().before(new Date())) {
      openChangeDialogue(true);
    }
  }

  private void initClosingHandler(){
    Window.addWindowClosingHandler(new Window.ClosingHandler() {
      @Override
      public void onWindowClosing(Window.ClosingEvent event) {
        event.setMessage("Vous êtes sur le point de quitter Atnv2.");
      }
    });
  }

  @Override
  public boolean onCloseTab(final Atnv2Tab atnv2Tab) {
    boolean canClose= atnv2Tab.getSimbaTabPresenter().requestClose();
    if(canClose){
      //Si on peut fermer l'onglet, on le ferme.
      doCloseTab(atnv2Tab);
    }else{
      //Sinon, on annule la fermeture et on affiche une popup de confirmations.
      final ConfirmMessageBox box=new ConfirmMessageBox(atnv2Tab.getTabContext().getLabel(),"Vous risquez de perdre des données. Continuer?");
      box.addHideHandler(new HideEvent.HideHandler() {
        @Override
        public void onHide(HideEvent event) {
          if(box.getHideButton()==box.getButtonById(Dialog.PredefinedButton.YES.name())){
            doCloseTab(atnv2Tab);
          }
        }
      });
      box.show();
    }
    return !canClose;
  }

  @Override
  public void onSelectTab(Atnv2TabType atnv2TabType) {
    RequestTabEvent.fire(this, new StaticTabContext(atnv2TabType));
  }

  /**
   * Ferme l'onglet passé en paramètre (sans demande de confirmation).
   * @param atnv2Tab l'onglet à fermer.
   */
  private void doCloseTab(Atnv2Tab atnv2Tab){
    atnv2Tab.getSimbaTabPresenter().getPresenterWidget().unbind();
    hmOpenedTabs.remove(atnv2Tab.getTabContext().getKey());
    getView().closeTab(atnv2Tab);
  }

  @Override
  public void onChangePassword() {
    openChangeDialogue(false);
  }

  private void openChangeDialogue(boolean displayWarning) {
    dialogChangePassword.setDisplayWarning(displayWarning);
    dialogChangePassword.setCallback(new DialogChangePassword.ChangePasswordCallback() {
      @Override
      public void onChangePassword(String newPassword) {
        Utilisateur utilisateur = (Utilisateur) SocleUtil.getUtilisateur();
        utilisateur.setMotDePasse(newPassword);
        utilisateurService.changePassword(utilisateur, new MethodCallback<Utilisateur>() {
          @Override
          public void onFailure(Method method, Throwable exception) {
            SocleInfo.display(SocleInfo.MessageType.ERROR, "Changement impossible du mot de passe : " + exception.getMessage());
            onLogout();
          }

          @Override
          public void onSuccess(Method method, Utilisateur utilisateur) {
            SocleInfo.display(SocleInfo.MessageType.ERROR, "Changement du mot de passe réussis");
            SocleUtil.setUtilisateur(utilisateur);
            dialogChangePassword.hide();
            onLogout();
          }
        }
        );
      }
    }
    );
    dialogChangePassword.show();
  }

  @Override
  public void onLogout(){
    logoutService.logout(new MethodCallback<Void>() {
      @Override
      public void onFailure(Method method, Throwable throwable) {
        Log.error("Une erreur s'est produite lors de la déconnexion.");
      }

      @Override
      public void onSuccess(Method method, Void aVoid) {
        //Close all tabs.
        for (Atnv2Tab atnv2Tab : hmOpenedTabs.values()) {
          doCloseTab(atnv2Tab);
        }
        SocleUtil.setUtilisateur(null);
        placeManager.revealPlace(new PlaceRequest.Builder().nameToken(NameTokens.LOGIN_PAGE).build());
      }
    });
  }

  /**
   * Ouvre l'onglet correspondant à l'événement.
   *
   * Si l'onglet est déjà ouvert, il devient actif. Sinon, il est créé puis il devient actif.
   *
   * @param event L'événement content le contexte de l'onglet à ouvrir
   * @see com.groupemre.socle.ihm.client.application.events.tabs.RequestTabEvent#getTabContext()
   */
  @ProxyEvent
  @Override
  public void openTab(RequestTabEvent event) {
    final AbstractTabContext tabContext=event.getTabContext();

    boolean creation=false;
    //Si l'onglet n'est pas ouvert, il est créé
    if (!hmOpenedTabs.containsKey(tabContext.getKey())){
      doCreateTab(tabContext);
    }

    Atnv2Tab tab=hmOpenedTabs.get(tabContext.getKey());
    //L'onglet devient actif.
    getView().setActiveTab(tab);
  }

  private void doCreateTab(AbstractTabContext<Atnv2TabType> tabContext){
    final Atnv2Tab atnv2Tab =getView().addTab(tabContext);
    hmOpenedTabs.put(tabContext.getKey(), atnv2Tab);
    tabFactory.getAsyncProvider(tabContext.getTabType()).get(new AsyncCallback<TabPresenter>() {
      @Override
      public void onFailure(Throwable caught) {
        Log.error("Echec lors de la récupération du presenter", caught);
      }

      @Override
      public void onSuccess(TabPresenter result) {
        atnv2Tab.initSimbaTabPresenter(result);
        setInSlot("",result.getPresenterWidget(),false);
      }
    });
  }

  @Override
  public void onCloseTab(CloseTabEvent event) {
    AbstractTabContext<Atnv2TabType> tabContext = event.getTabContext();
    if(hmOpenedTabs.containsKey(tabContext.getKey())){
      Atnv2Tab widgets = hmOpenedTabs.get(tabContext.getKey());
      onCloseTab(widgets);
    }
  }

  public interface MyView extends View , HasUiHandlers<MainUiHandlers> {
    void updateTrees();

    Atnv2Tab addTab(AbstractTabContext tabContext);

    void setActiveTab(Atnv2Tab tab);

    void closeTab(IsWidget widget);

    HasText getLabelUtilisateur();

  }

  @ProxyCodeSplit
  @NameToken(NameTokens.MAIN_PAGE)
  public interface MyProxy extends ProxyPlace<MainPresenter> {
  }
}
