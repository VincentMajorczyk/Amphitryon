<?php

require_once '../modeles/dao/Param.php';
require_once '../modeles/dao/DBConnex.php';
require_once '../modeles/dao/CommandeDAO.php';




print(json_encode(CommandeDAO::voirCommandes()));
