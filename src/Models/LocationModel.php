<?php

namespace Mvc\Models;

use Config\Model;
use PDO;

class LocationModel extends Model
{
    public function eachHouse()
    {
        $statement = $this->pdo->prepare('SELECT * FROM `house`');
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getHouseByID($id) {
        $statement = $this->pdo->prepare('SELECT * FROM `house` WHERE `id` = :id');
        $statement->execute([
            'id' => $id
        ]);

        return $statement->fetch(PDO::FETCH_ASSOC);
    }

    public function insertHouse($houseCity, $nightPrice, $sqrtMeters, $description, $dpe, $ges, $nbOfRooms, $nbOfChambers, $image1, $image2, $image3)
    {
        $statement = $this->pdo->prepare('INSERT INTO `house` (`city`, `nightPrice`, `sqrtMeters`, `description`, `dpe`, `ges`, `nbOfRooms`, `nbOfChambers`, `image1`, `image2`, `image3`) VALUES (:city, :nightPrice, :sqrtMeters, :description, :dpe, :ges, :nbOfRooms, :nbOfChambers, :image1, :image2, :image3)');
        $statement->execute([
            'city' => $houseCity,
            'nightPrice' => $nightPrice,
            'sqrtMeters' => $sqrtMeters,
            'description' => $description,
            'dpe' => $dpe,
            'ges' => $ges,
            'nbOfRooms'=> $nbOfRooms,
            'nbOfChambers' => $nbOfChambers,
            'image1' => $image1,
            'image2' => $image2,
            'image3' => $image3
        ]);
    }

    public function deleteHouse($houseID)
    {
        $statement = $this->pdo->prepare('DELETE FROM `house` WHERE id = :houseID');
        $statement->execute([
            'houseID' => $houseID
        ]);
    }
}