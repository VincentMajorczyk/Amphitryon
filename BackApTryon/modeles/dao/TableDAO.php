<?php
class TableDAO{
    public static function afficherTables(){
		try{
			$sql = "select * 
            from TABLEE " ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = $e->getMessage();
		}
		return $reponse;
	}

	public static function ajouterTables(){
		try{
			$sql = "INSERT INTO TABLEE VALUES (:date, :idService, :idUtilisateur, :nbPlace);" ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->bindParam("date", $date);
			$requetePrepa->bindParam("idService", $idService);
			$requetePrepa->bindParam("nomTable", $nomTable);
			$requetePrepa->bindParam("idUtilisateur", $idUtilisateur);
			$requetePrepa->bindParam("nbPlace", $nbPlace);
			$requetePrepa->execute();
		}
		catch(Exception $e){
			$reponse = $e->getMessage();
		}
	}

	public static function deleteTables($date, $idService, $nomTable){
		try{
			$sql = "DELETE FROM TABLEE WHERE DATEE = :date AND IDSERVICE = :idService AND NOMTABLE = :nomTable" ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->bindParam("date", $date);
			$requetePrepa->bindParam("idService", $idService);
			$requetePrepa->bindParam("nomTable", $nomTable);
			$requetePrepa->execute();
		}
		catch(Exception $e){
			$reponse = $e->getMessage();
		}
	}

	public static function modifTables($idService, $nomTable, $idUtilisateur, $nbPlace){
		try{
			$sql = "UPDATE TABLEE SET DATEE = :date, IDSERVICE = :idService, NOMTABLE = :nomTable, IDUTILISATEUR = :idUtilisateur, NBPLACE = :nbPlace" ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->bindParam("date", $date);
			$requetePrepa->bindParam("idService", $idService);
			$requetePrepa->bindParam("nomTable", $nomTable);
			$requetePrepa->bindParam("idUtilisateur", $idUtilisateur);
			$requetePrepa->bindParam("nbPlace", $nbPlace);
			$requetePrepa->execute();
		}
		catch(Exception $e){
			$reponse = $e->getMessage();
		}
	}
	







}