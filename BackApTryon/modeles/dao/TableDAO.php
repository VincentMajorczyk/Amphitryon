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

	public static function ajouterTables($date, $idService, $nomTable, $nbPlace){
		try{
			$sql = "INSERT INTO TABLEE (DATEE, IDSERVICE, NOMTABLE, NBPLACE) VALUES (:date, :idService, :nomTable, :nbPlace);" ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->bindParam("date", $date);
			$requetePrepa->bindParam("idService", $idService);
			$requetePrepa->bindParam("nomTable", $nomTable);
			$requetePrepa->bindParam("nbPlace", $nbPlace);
			$requetePrepa->execute();
		}
		catch(Exception $e){
			$reponse = $e->getMessage();
		}
		return $reponse;
	}

	public static function deleteTables($date, $idService, $nomTable){
		try{
			$sql = "DELETE FROM TABLEE WHERE DATEE = :date AND IDSERVICE = :idService AND NOMTABLE = :nomTable" ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->bindParam("date", $date);
			$requetePrepa->bindParam("idService", $idService);
			$requetePrepa->bindParam("nomTable", $nomTable);
			$requetePrepa->execute();
			$reponse = 1;
		}
		catch(Exception $e){
			$reponse = $e->getMessage();
		}
		return $reponse;
	}

	public static function modifTables($date, $idService, $nomTable, $nbPlace){
		try{
			$sql = "UPDATE TABLEE SET DATEE = :date, IDSERVICE = :idService, NOMTABLE = :nomTable, NBPLACE = :nbPlace WHERE DATEE = :date AND NOMTABLE = :nomTable AND IDSERVICE = :idService" ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->bindParam("date", $date);
			$requetePrepa->bindParam("idService", $idService);
			$requetePrepa->bindParam("nomTable", $nomTable);
			$requetePrepa->bindParam("nbPlace", $nbPlace);
			$requetePrepa->execute();
			$reponse = 1;
		}
		catch(Exception $e){
			$reponse = $e->getMessage();
		}
		return $reponse;

	}
	







}