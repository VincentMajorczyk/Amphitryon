<?php

class CommandeDAO
{
    public static function voirCommandes(){
        try{
            $sql = "select * from COMMANDE " ;
            $requetePrepa = DBConnex::getInstance()->prepare($sql);
            $requetePrepa->execute();
            $reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            $reponse = $e->getMessage();
        }
        return $reponse;
    }

}