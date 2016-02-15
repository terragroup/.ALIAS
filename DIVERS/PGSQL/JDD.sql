-- *****************************************************************************
-- EXECUTER LE FICHIER : psql -f JDD.sql atn
-- *****************************************************************************


-- #############################################################################
-- MOINS PRIORITAIRE
-- #############################################################################


--##############################################################################
-- 1 - envoie en masse / envoie de mails
-- <<<<<<< A faire à chaque fois >>>>>>>
--##############################################################################
UPDATE programmedediffusion_pdd set pdd_statut='COMPLETE' where pdd_id in (520192, 520191, 520190, 523053, 523054, 523055)


-- #############################################################################
-- 2 - simuler le fait que les transporteurs ont le DCP sur leurs CATALOGUES
-- <<<<<<<  A faire une fois tous les matins >>>>>>>
-- EN LOCAL = pour que tous les DCP soient valident
-- SOL : Il faut que tu mettes le complexe sur les 2 transporteurs
-- #############################################################################
UPDATE dcp_dcp set dcp_presenecesmartjog=true, dcp_preseneceglobcast=true


-- #############################################################################
-- # 3 - eviter de reccuperer des DCP, supprimer toutes les lignes dans toutes les tables de routages
-- # A faire une fois au debut (apres import BDD)
-- #############################################################################
DELETE FROM routerplaylistdelivery_rpd;
DELETE FROM routerdcptransfer_rdt;
DELETE FROM routerdcpimport_rdi;
DELETE FROM routerdcpdelivery_rdd;
TRUNCATE public.routercontentdelivery_rcd CASCADE;

-- #############################################################################
-- # 4 - TODO = mettre tout les complexes sur transporteur : CLEF USB
-- #############################################################################
-- TODO






-- #############################################################################
-- MOINS PRIORITAIRE
-- #############################################################################
