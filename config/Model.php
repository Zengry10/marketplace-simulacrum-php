<?php

namespace Config;

use PDO;

class Model
{
    protected PDO $pdo;

    public function __construct()
    {
        $this->pdo = new PDO('mysql:host=phpmyadmin.student-sup.info;dbname=gajc9642_tmh;charset=UTF8', 'gajc9642_tmh', 'O9nQGEFZ2}!_{fnTSm', [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::MYSQL_ATTR_FOUND_ROWS => true
            ]
        );
    }
}