<?php

require_once '../modeles/dao/Param.php';
require_once '../modeles/dao/DBConnex.php';
require_once '../modeles/dao/TableDAO.php';




print(json_encode(TableDAO::afficherTables()));
