<?php
class PlatDAO{
	public static function all(){
		try{
			$sql = "select * 
            from PLAT " ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetch(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = $e->getMessage();
		}
		return $reponse;
	}

    public static function entrees(){
		try{
			$sql = "select *
            from PLAT
            where IDCATEGPLAT = 1" ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = $e->getMessage();
		}
		return $reponse;
	}

    public static function plats(){
		try{
			$sql = "select *
            from PLAT
            where IDCATEGPLAT = 2" ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = $e->getMessage();
		}
		return $reponse;
	}

    public static function desserts(){
		try{
			$sql = "select *
            from PLAT
            where IDCATEGPLAT = 3" ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = $e->getMessage();
		}
		return $reponse;
	}

	public static function creeplats($idcatplat, $nom, $descriptif){
			$requetePrepa = DBConnex::getInstance()->prepare("INSERT INTO PLAT(IDCATEGPLAT, NOMPLAT, DESCRIPTIF) VALUES (:idcatplat, :nom,:descriptif) ") ;
			$requetePrepa -> bindParam(':idcatplat', $idcatplat);
			$requetePrepa -> bindParam(':nom', $nom);
			$requetePrepa -> bindParam(':descriptif', $descriptif);
			
			return $requetePrepa->execute();
	}
	
	
    
}
