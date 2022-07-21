<?php

namespace Mvc\Controllers;

use Config\Controller;
use Mvc\Models\LocationModel;

class LocationController extends Controller
{
    private LocationModel $locationModel;

    public function __construct()
    {
        $this->locationModel = new LocationModel();
        parent::__construct();
    }

    public function base()
    {
        echo $this->twig->render('Page/home.html.twig');
    }

    public function locationList()
    {
        if (isset($_SESSION['user'])) {
            $locations = $this->locationModel->eachHouse();

            echo $this->twig->render('Admin/Location/locationList.html.twig', [
                'locations' => $locations,
            ]);

        } else {
            header('Location: /register');
            exit;
        }
    }

    public function locationCreate()
    {
        if (isset($_SESSION['user'])) {
            if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['houseCity']) && isset($_POST['nightPrice']) && isset($_POST['sqrtMeters']) && isset($_POST['description']) && isset($_POST['dpe']) && isset($_POST['ges']) && isset($_POST['nbOfRooms']) && isset($_POST['nbOfChambers'])) {
                $from = $_FILES['uploadedFile1']['tmp_name'];
                $to = __DIR__ . '/../../public/images/house/' . $_FILES['uploadedFile1']['name'];
                move_uploaded_file($from, $to);

                $from = $_FILES['uploadedFile2']['tmp_name'];
                $to = __DIR__ . '/../../public/images/house/' . $_FILES['uploadedFile2']['name'];
                move_uploaded_file($from, $to);

                $from = $_FILES['uploadedFile3']['tmp_name'];
                $to = __DIR__ . '/../../public/images/house/' . $_FILES['uploadedFile3']['name'];
                move_uploaded_file($from, $to);

                $this->locationModel->insertHouse($_POST['houseCity'], $_POST['nightPrice'], $_POST['sqrtMeters'], $_POST['description'], $_POST['dpe'], $_POST['ges'], $_POST['nbOfRooms'], $_POST['nbOfChambers'], $_FILES['uploadedFile1']['name'], $_FILES['uploadedFile2']['name'], $_FILES['uploadedFile3']['name']);

                header('Location: /admin/location');
            } else {
                echo $this->twig->render('Admin/Location/locationCreate.html.twig');
            }
        } else {
            header('Location: /register');
            exit;
        }
    }

    public function locationDelete($houseID)
    {
        $this->locationModel->deleteHouse($houseID);

        header('Location: /admin/location');
        exit;
    }

    public function houseTemplate($houseID)
    {
        $house = $this->locationModel->getHouseByID($houseID);

        if ($house === false) {
            header('Location: /');
        }
        echo $this->twig->render('/Page/house.html.twig', [
            'house' => $house
        ]);
    }

    public function information()
    {
        echo $this->twig->render('/Page/information.html.twig');
    }
    public function parting()
    {
        echo $this->twig->render('/Page/parting.html.twig');
    }
}