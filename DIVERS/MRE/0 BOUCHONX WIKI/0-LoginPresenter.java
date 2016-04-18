package com.groupemre.atnv2.ihm.client.views.login;

import com.google.gwt.http.client.Request;
import com.google.gwt.http.client.RequestCallback;
import com.google.gwt.http.client.Response;
import com.google.gwt.user.client.ui.HasValue;
import com.google.inject.Inject;
import com.google.web.bindery.event.shared.EventBus;
import com.groupemre.atnv2.dto.utilisateur.Utilisateur;
import com.groupemre.atnv2.ihm.client.application.services.UtilisateurService;
import com.groupemre.socle.ihm.client.application.SocleUtil;
import com.groupemre.socle.ihm.client.application.mvp.NameTokens;
import com.groupemre.socle.ihm.client.view.login.PostRequest;
import com.gwtplatform.mvp.client.Presenter;
import com.gwtplatform.mvp.client.View;
import com.gwtplatform.mvp.client.annotations.NameToken;
import com.gwtplatform.mvp.client.annotations.ProxyCodeSplit;
import com.gwtplatform.mvp.client.proxy.PlaceManager;
import com.gwtplatform.mvp.client.proxy.ProxyPlace;
import com.gwtplatform.mvp.client.proxy.RevealRootContentEvent;
import com.gwtplatform.mvp.shared.proxy.PlaceRequest;
import com.sencha.gxt.widget.core.client.event.SelectEvent;
import org.fusesource.restygwt.client.Method;
import org.fusesource.restygwt.client.MethodCallback;

/**
 * @author adenoyelle
 *         Date: 26/03/13 18:38
 */
public class LoginPresenter extends Presenter<LoginPresenter.MyView, LoginPresenter.MyProxy> {

  private static final String ACTION = "j_spring_security_check";
  private static final String PARAM_USER = "j_username";
  private static final String PARAM_PASSWORD = "j_password";
  private static final String PARAM_REMEMBER_ME = "_spring_security_remember_me";

  @Inject
  private PlaceManager placeManager;

  @Inject
  private UtilisateurService utilisateurService;

  @Inject
  public LoginPresenter(EventBus eventBus, MyView view, MyProxy proxy) {
    super(eventBus, view, proxy);
  }

  @Override
  protected void revealInParent() {
    RevealRootContentEvent.fire(this, this);
  }

  @Override
  protected void onReveal() {
    if(SocleUtil.getUtilisateur()!=null){
      placeManager.revealPlace(new PlaceRequest.Builder().nameToken(NameTokens.MAIN_PAGE).build());
    }
    getView().clear();
  }

  @Override
  protected void onBind() {
    super.onBind();

    getView().focusLogin();
    //Lorsque l'utilisateur clique sur le bouton connexion, vérifier les identifiants.
//    registerHandler(getView().getButtonLogin().addSelectHandler(new SelectEvent.SelectHandler() {
//
//      @Override
//      public void onSelect(SelectEvent event) {
//        tryConnect();
//      }
//    }
//    )
//    );

    tryConnect(); // bouchonx

  }

  protected void tryConnect(){
    PostRequest postRequest=getPoster();
//    postRequest.addFormParam(PARAM_USER,getView().getTextFieldLogin().getValue());
//    postRequest.addFormParam(PARAM_PASSWORD,getView().getTextFieldPassword().getValue());

    postRequest.addFormParam(PARAM_USER,"admin");
    postRequest.addFormParam(PARAM_PASSWORD,"x");

    postRequest.addFormParam(PARAM_REMEMBER_ME,Boolean.TRUE.toString());
    postRequest.send(ACTION, new RequestCallback() {
      @Override
      public void onResponseReceived(Request request, Response response) {
        switch(response.getStatusCode()){
          case Response.SC_OK:
            //Bon mot de passe -> OK
            onLoginSuccess();
            break;
          case Response.SC_UNAUTHORIZED:
            //Mauvais mot de passe -> Affichage "Mauvais mot de passe"
            getView().showBadPassword();
            break;
          default :
            //Sinon, erreur inconnue -> "Une erreur est survenue"
            getView().showErrorOccured();
        }
      }

      @Override
      public void onError(Request request, Throwable exception) {
        getView().showErrorOccured();
      }
    });
  }

  public PostRequest getPoster() {
    return new PostRequest();
  }

  /**
   * Méthode appelée si l'authentification est passée.
   *
   * Dans ce cas, on va chercher l'{@link com.groupemre.socle.dto.utilisateur.IUtilisateur} et on le stocke.
   */
  private void onLoginSuccess() {
    utilisateurService.getUtilisateur(new MethodCallback<Utilisateur>() {
      @Override
      public void onFailure(Method method, Throwable throwable) {
        getView().showErrorOccured();
      }

      @Override
      public void onSuccess(Method method, Utilisateur utilisateur) {
        SocleUtil.setUtilisateur(utilisateur);
        placeManager.revealPlace(new PlaceRequest.Builder().nameToken(NameTokens.MAIN_PAGE).build());
      }
    }
    );
  }

  @ProxyCodeSplit
  @NameToken(NameTokens.LOGIN_PAGE)
  public interface MyProxy extends ProxyPlace<LoginPresenter> {

  }

  public interface MyView extends View {
    HasValue<String> getTextFieldLogin();

    HasValue<String> getTextFieldPassword();

    SelectEvent.HasSelectHandlers getButtonLogin();

    void showBadPassword();

    void showErrorOccured();

    void focusLogin();

    void clear();
  }
}
