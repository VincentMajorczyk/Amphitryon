<?php

require_once '../modeles/dao/Param.php';
require_once '../modeles/dao/DBConnex.php';
require_once '../modeles/dao/UtilisateurDAO.php';



$_POST['login'] = "bob" ;
$_POST['mdp'] = "bob";



print(json_encode(UtilisateurDAO::authentification($_POST['login'], $_POST['mdp'])));
