<?php

require_once '../modeles/dao/Param.php';
require_once '../modeles/dao/DBConnex.php';
require_once '../modeles/dao/ServiceDAO.php';




print(json_encode(ServiceDAO::lesServices()));