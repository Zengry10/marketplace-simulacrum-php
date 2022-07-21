<?php

namespace Mvc\Models;

use Config\Model;
use PDO;

class UserModel extends Model
{
    public function createUser(string $firstname, string $lastname, string $email, string $password, string $phoneNumber)
    {
        $statement = $this->pdo->prepare('INSERT INTO `user`(`firstname`, `lastname`, `email`, `password`, `phoneNumber`) VALUES (:firstname, :lastname, :email, :password, :phoneNumber)');
        $statement->execute([
            'firstname' => $firstname,
            'lastname' => $lastname,
            'email' => $email,
            'password' => $password,
            'phoneNumber' => $phoneNumber,
        ]);
    }

    public function findOneByEmail(string $email)
    {
        $statement = $this->pdo->prepare('SELECT * FROM `user` WHERE `email` = :email');
        $statement->execute([
            'email' => $email
        ]);

        return $statement->fetch(PDO::FETCH_ASSOC);
    }
}