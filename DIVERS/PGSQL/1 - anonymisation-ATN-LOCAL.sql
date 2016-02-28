-- ATN - ANONYMISATION

-- REPERTOIRE DU SCRIPT :
-- /mnt/groups/INFO/MDV/00_EXPLOITATION/4_ATN_v2/1_Interventions\ sur\ les\ environnements/Script\ anonymisation/

-- TODO - CHANGER A LA MAIN DANS --VARCONFIG-- (pas dans ce script ou a rajouter pour moi en local):
-- copy.usb.xml.path -> /mnt/USB/USB

-- executer le fichier
-- psql -f anonymisation-ATN-LOCAL.sql atn


-- *****************************************************************************
-- Les mises a jour :
-- * fabrice.crochard-mediavision@hotmail.fr           >    axel.regnoult.mre@gmail.com
-- * /mnt/archives/GROUPS/COMMUNS/ATNV2/USB/Recette/   >    /mnt/N/USB/
-- *
-- *
-- *
-- *****************************************************************************

-- CHANGEMENT
-- update complexe_cpx set cpx_smartjogstockage_id = 64676844 where cpx_id = 315;  -- complexe.getDirServerLocalId() = 64676844    ET      rapport.getComplexes() = 315


ATTENTION CE N EST PAS POUR LA RECETTE CAR J Y AIS MIS MON MAIL


update complexe_cpx set cpx_adressemail='axel.regnoult.mre@gmail.com';
update routeur_rou set rou_adressereseau=1234 where rou_nom='SMARTJOG';
update routeur_rou set rou_adressereseau='1000001' where rou_nom='GLOBECAST';
update utilisateur_usr set usr_email = 'axel.regnoult.mre@gmail.com';
update variableconfig_con set con_value = 'axel.regnoult.mre@gmail.com' where con_id = 16;
update variableconfig_con set con_value = 'INTEGMDSWEB.mre.pub' where con_id = 20;
update variableconfig_con set con_value = '21' where con_id = 21;
update variableconfig_con set con_value = 'adminmv' where con_id = 22;
update variableconfig_con set con_value = 'innovation' where con_id = 23;
update variableconfig_con set con_value = '/playlists' where con_id = 24;
update variableconfig_con set con_value = '/mnt/N/USB/' where con_id = 25;
update variableconfig_con set con_value = 'INTEGMDSWEB.mre.pub' where con_id = 26;
update variableconfig_con set con_value = 'adminmv' where con_id = 27;
update variableconfig_con set con_value = 'innovation' where con_id = 28;
update variableconfig_con set con_value = '21' where con_id = 29;
update variableconfig_con set con_value = 'DemandesLog/YMAGIS' where con_id = 30;
update variableconfig_con set con_value = 'INTEGMDSWEB.mre.pub' where con_id = 32;
update variableconfig_con set con_value = 'adminmv' where con_id = 33;
update variableconfig_con set con_value = 'innovation' where con_id = 34;
update variableconfig_con set con_value = '21' where con_id = 35;
update variableconfig_con set con_value = 'DemandesLog/Kinepolis' where con_id = 36;
update variableconfig_con set con_value = '/mnt/N/' where con_id = 37;
update variableconfig_con set con_value = 'INTEGMDSWEB.mre.pub' where con_id = 38;
update variableconfig_con set con_value = 'adminmv' where con_id = 39;
update variableconfig_con set con_value = 'innovation' where con_id = 40;
update variableconfig_con set con_value = '21' where con_id = 41;
update variableconfig_con set con_value = 'DemandesLog/ADDE' where con_id = 42;
update variableconfig_con set con_value = 'INTEGMDSWEB.mre.pub' where con_id = 43;
update variableconfig_con set con_value = 'adminmv' where con_id = 44;
update variableconfig_con set con_value = 'innovation' where con_id = 45;
update variableconfig_con set con_value = '21' where con_id = 46;
update variableconfig_con set con_value = 'DemandesLog/CGR' where con_id = 47;
update variableconfig_con set con_value = 'axel.regnoult.mre@gmail.com' where con_id = 49;
update variableconfig_con set con_value = 'axel.regnoult.mre@gmail.com' where con_id = 50;
update variableconfig_con set con_value = 'ReceptionLog/ADDE' where con_id = 51;
update variableconfig_con set con_value = 'ReceptionLog/Ymagis' where con_id = 52;
update variableconfig_con set con_value = 'ReceptionLog/CGR' where con_id = 53;
update variableconfig_con set con_value = 'ReceptionLog/Kinepolis' where con_id = 54;
update variableconfig_con set con_value = 'INTEGMDSWEB.mre.pub' where con_id = 55;
update variableconfig_con set con_value = 'adminmv' where con_id = 56;
update variableconfig_con set con_value = 'innovation' where con_id = 57;
update variableconfig_con set con_value = '21' where con_id = 58;
update variableconfig_con set con_value = 'ReceptionLog/Smartjog' where con_id = 59;
update variableconfig_con set con_value = '1' where con_id = 60;
update variableconfig_con set con_value = '/mnt/N/ImportManuel' where con_id = 61;
update variableconfig_con set con_value = 'INTEGMDSWEB.mre.pub' where con_id = 74;
update variableconfig_con set con_value = 'adminmv' where con_id = 75;
update variableconfig_con set con_value = 'innovation' where con_id = 76;
update variableconfig_con set con_value = '21' where con_id = 77;

update complexe_cpx set cpx_smartjogstockage_id = 12345678;
update complexe_cpx set cpx_smartjogstockage_id = 50610953 where cpx_id = 3;
update complexe_cpx set cpx_smartjogstockage_id = 50610887 where cpx_id = 4;
update complexe_cpx set cpx_smartjogstockage_id = 50610673 where cpx_id = 7;
update complexe_cpx set cpx_smartjogstockage_id = 50611019 where cpx_id = 28;
update complexe_cpx set cpx_smartjogstockage_id = 64676846 where cpx_id = 63;
update complexe_cpx set cpx_smartjogstockage_id = 65021897 where cpx_id = 97;
update complexe_cpx set cpx_smartjogstockage_id = 65022256 where cpx_id = 98;
update complexe_cpx set cpx_smartjogstockage_id = 65127936 where cpx_id = 262;
update complexe_cpx set cpx_smartjogstockage_id = 50610925 where cpx_id = 274;
update complexe_cpx set cpx_smartjogstockage_id = 50610785 where cpx_id = 292;
update complexe_cpx set cpx_smartjogstockage_id = 64676844 where cpx_id = 315;  -- complexe.getDirServerLocalId() = 64676844    ET      rapport.getComplexes() = 315
update complexe_cpx set cpx_smartjogstockage_id = 65022176 where cpx_id = 393;
update complexe_cpx set cpx_smartjogstockage_id = 50610917 where cpx_id = 634;
update complexe_cpx set cpx_smartjogstockage_id = 50610743 where cpx_id = 735;
update complexe_cpx set cpx_smartjogstockage_id = 50611014 where cpx_id = 852;
update dcp_dcp set dcp_smartjogcatalogueidentifiant = 35560476 where dcp_id = 156;
update dcp_dcp set dcp_smartjogcatalogueidentifiant = 1838840 where dcp_id = 159;
update dcp_dcp set dcp_smartjogcatalogueidentifiant = 35391896 WHERE dcp_id = 1092;
update dcp_dcp set dcp_smartjogcatalogueidentifiant = 1838840 WHERE dcp_id = 1091;
