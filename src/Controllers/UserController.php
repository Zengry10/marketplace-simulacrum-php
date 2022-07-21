<?php

namespace Mvc\Controllers;

use Config\Controller;
use Mvc\Models\MarketplaceModel;
use Mvc\Models\UserModel;

class UserController extends Controller
{
    private MarketplaceModel $marketplaceModel;
    private UserModel $userModel;

    public function __construct()
    {
        $this->marketplaceModel = new MarketplaceModel();
        $this->userModel = new userModel();
        parent::__construct();
    }

    public function register()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['firstname']) && isset($_POST['lastname']) && isset($_POST['email']) && isset($_POST['password']) && isset($_POST['passwordVerification']) && isset($_POST['phoneNumber']) && $_POST['password'] === $_POST['passwordVerification'] && strlen($_POST['password']) >= 8)
        {
            $user = $this->userModel->findOneByEmail($_POST['email']);

            if ($user === false) {
                $this->userModel->createUser($_POST['firstname'], $_POST['lastname'], $_POST['email'], password_hash($_POST['password'], PASSWORD_DEFAULT), $_POST['phoneNumber']);

                header('Location: /login');
                exit;
            }
        }

        echo $this->twig->render('User/register.html.twig');
    }

    public function login()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['email']) && isset($_POST['password']))
        {
            $user = $this->userModel->findOneByEmail($_POST['email']);

            if ($user && password_verify($_POST['password'], $user['password'])) {
                $_SESSION['user'] = $user;

                header('Location: /');
                exit;
            }
        }

        echo $this->twig->render('User/login.html.twig');
    }

    public function logout() {
        session_destroy();
        header('Location: /login');
        exit;
    }

    public function account()
    {
        $user = $this->userModel->findOneByEmail($_SESSION['user']['email']);
        $products = $this->marketplaceModel->eachCommands($_SESSION['user']['id']);
        $commands = [];

        foreach($products as $product) {
            $commands[$product['commandDate']][] = $product;
        }

        echo $this->twig->render('User/account.html.twig', [
            'user' => $user,
            'commands' => $commands
        ]);
    }
}