/* Titre : exemples_jointures.sql*/
/* Auteur : raphael.favre@cpnv.ch*/
/* Version : 29-SEP-2018*/

-- 1ère requête
select joueurs.prenom_joueur, joueurs.nom_joueur, sponsors.nom_sponsor  from joueurs
right JOIN sponsors on joueurs.sponsors_id_sponsor = sponsors.id_sponsor
WHERE sponsors.id_sponsor IS NULL;