<?php

class ServiceDAO
{
    public static function lesServices(){
        try{
            $sql = "select * from service" ;
            $requetePrepa = DBConnex::getInstance()->prepare($sql);
            $requetePrepa->execute();
            $reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            $reponse = $e->getMessage();
        }
        return $reponse;
    }

}