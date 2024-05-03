<?php

require_once '../modeles/dao/Param.php';
require_once '../modeles/dao/DBConnex.php';
require_once '../modeles/dao/PlatDAO.php';


print(json_encode(PlatDAO::creeplats($_POST['IDPLAT'], $_POST['NOMPLAT'], $_POST['DESCRIPTIF'])));
