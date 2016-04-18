-- -----------------------------------------------------------------
-- ERREUR TECHNIQUE =
-- -----------------------------------------------------------------
1 - regarde le nom du message DANS LE CODE APPLICAITF
Fichier non trouvé sur le serveur Smartjog central.
2 -
-- -----------------------------------------------------------------
-- PB 1 : IMPORT DCP = entre SMARTJOG et ATN
-- -----------------------------------------------------------------
select *
from routerdcpimport_rdi
where rdi_universalid LIKE '73079889';
-- -----------------------------------------------------------------
-- PB 2 : TRANSFERT DCP = entre SMARTJOG et COMPLEXES
-- -----------------------------------------------------------------
-- AXL(note mais oublie)
select *
from routerdcptransfer_rdt
where rdt_catalogue_id LIKE '73079889';
-- -----------------------------------------------------------------
-- WIKI
SELECT
        *
FROM
        dcp_dcp
WHERE
        (dcp_dcp.dcp_smartjogcatalogueidentifiant = 73079889)
-- -----------------------------------------------------------------
-- PB 3 :
-- -----------------------------------------------------------------
select *
from dcp_dcp
where rdt_catalogue_id LIKE '73079889';
-- -----------------------------------------------------------------
SELECT
        dcp_nom, dcp_globecastcatalogueidentifiant, dcp_smartjogcatalogueidentifiant
FROM
        dcp_dcp
WHERE
   dcp_nom like 'ACCOR-ARENA_ADV_F_FR-XX_FR_51_2K_20151110_ECL_OV'
--OR dcp_nom like 'OPEL-BAYONNE_ADV_F_XX-XX_XX_2K_ECL_20151109_ECL_OV'
--OR dcp_nom like 'OPEL-BELFORT_ADV_F_XX-XX_XX_2K_ECL_20151109_ECL_OV'
--OR dcp_nom like 'OPEL-CHATEAUROUX_ADV_F_XX-XX_XX_2K_ECL_20151110_ECL_OV'
--OR dcp_nom like 'OPEL-DAX_ADV_F_XX-XX_XX_2K_ECL_20151109_ECL_OV'
--OR dcp_nom like 'OPEL-DIEPPE_ADV_F_XX-XX_XX_2K_ECL_20151109_ECL_OV'
--OR dcp_nom like 'OPEL-POITIERS_ADV_F_XX-XX_XX_2K_ECL_20151109_ECL_OV'
--OR dcp_nom like 'OPEL-ROCHEFORT_ADV_F_XX-XX_XX_2K_ECL_20151110_ECL_OV'
--OR dcp_nom like 'OPEL-ROSHEIM_ADV_F_XX-XX_XX_2K_ECL_20151109_ECL_OV'
--OR dcp_nom like 'OPEL-SAINTE-GENEVIEVE-DES-BOIS_ADV_F_XX-XX_XX_2K_ECL_20151109_ECL_OV'
--OR dcp_nom like 'OPEL-SAVERNE_ADV_F_XX-XX_XX_2K_ECL_20151109_ECL_OV'
;

-- -----------------------------------------------------------------
--
-- -----------------------------------------------------------------
select *
from dcp_dcp
where dcp_nom like 'ACCOR-ARENA_ADV_F_FR-XX_FR_51_2K_20151110_ECL_OV';

       
