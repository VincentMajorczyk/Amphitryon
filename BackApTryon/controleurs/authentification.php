<?php

require_once '../modeles/dao/Param.php';
require_once '../modeles/dao/DBConnex.php';
require_once '../modeles/dao/UtilisateurDAO.php';



//$_POST['login'] ="Tourmichmich45@gmail.com" ;
//$_POST['mdp'] = "tour123";



print(json_encode(UtilisateurDAO::authentification($_POST['login'], $_POST['mdp'])));
