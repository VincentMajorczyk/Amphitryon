<?php
class UtilisateurDAO{
	public static function authentification($login , $mdp){
		try{
			$sql = "select IDUTILISATEUR, PRENOM , NOM , MAIL ,
			POSTE from UTILISATEUR 
			where MAIL= :login and MDP = :mdp " ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->bindParam("login", $login);
			$requetePrepa->bindParam("mdp", $mdp);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetch(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = $e->getMessage();
		}
		return $reponse;
	}
}
