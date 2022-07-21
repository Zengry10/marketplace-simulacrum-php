<?php

namespace Mvc\Controllers;

use Config\Controller;
use Mvc\Models\LocationModel;
use Mvc\Models\MarketplaceModel;
use Mvc\Models\UserModel;

class MarketplaceController extends Controller
{
    private MarketplaceModel $marketplaceModel;
    private UserModel $userModel;

    public function __construct()
    {
        $this->marketplaceModel = new MarketplaceModel();
        $this->userModel = new userModel();
        parent::__construct();
    }

    public function marketplaceList()
    {
        if (isset($_SESSION['user'])) {
            $products = $this->marketplaceModel->eachProducts();

            echo $this->twig->render('/Admin/Marketplace/marketplaceList.html.twig', [
                'products' => $products,
            ]);

        } else {
            header('Location: /register');
            exit;
        }
    }

    public function marketplaceCreate()
    {
        if (isset($_SESSION['user'])) {
            if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['name']) && isset($_POST['category']) && isset($_POST['description']) && isset($_POST['price'])) {
                $from = $_FILES['uploadedFile1']['tmp_name'];
                $to = __DIR__ . '/../../public/images/product/' . $_FILES['uploadedFile1']['name'];
                move_uploaded_file($from, $to);

                $from = $_FILES['uploadedFile2']['tmp_name'];
                $to = __DIR__ . '/../../public/images/product/' . $_FILES['uploadedFile2']['name'];
                move_uploaded_file($from, $to);

                $from = $_FILES['uploadedFile3']['tmp_name'];
                $to = __DIR__ . '/../../public/images/product/' . $_FILES['uploadedFile3']['name'];
                move_uploaded_file($from, $to);

                $this->marketplaceModel->insertProduct($_POST['name'], $_POST['category'], $_POST['description'], $_POST['price'], $_FILES['uploadedFile1']['name'], $_FILES['uploadedFile2']['name'], $_FILES['uploadedFile3']['name']);

                header('Location: /admin/marketplace');
                exit;
            } else {
                $categories = $this->marketplaceModel->eachCategories();

                echo $this->twig->render('/Admin/Marketplace/marketplaceCreate.html.twig', [
                    'categories' => $categories,
                ]);
            }
        } else {
            header('Location: /register');
            exit;
        }
    }

    public function marketplaceDelete($productID)
    {
        if (isset($_SESSION['user'])) {
            $this->marketplaceModel->deleteProduct($productID);

            header('Location: /admin/marketplace');
            exit;
        } else {
            header('Location: /register');
            exit;
        }
    }

    public function marketplaceCategoryList()
    {
        if (isset($_SESSION['user'])) {
            $products = $this->marketplaceModel->eachCategories();

            echo $this->twig->render('/Admin/Marketplace/Category/categoryList.html.twig', [
                'products' => $products,
            ]);

        } else {
            header('Location: /register');
            exit;
        }
    }

    public function marketplaceCategoryCreate()
    {
        if (isset($_SESSION['user'])) {
            if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['name'])) {
                $this->marketplaceModel->insertCategory($_POST['name']);

                header('Location: /admin/marketplace/category');
                exit;
            } else {
                echo $this->twig->render('/Admin/Marketplace/Category/categoryCreate.html.twig');
            }
        } else {
            header('Location: /register');
            exit;
        }
    }

    public function marketplaceCategoryDelete($productID)
    {
        if (isset($_SESSION['user'])) {
            $this->marketplaceModel->deleteCategory($productID);

            header('Location: /admin/marketplace/category');
            exit;
        } else {
            header('Location: /register');
            exit;
        }
    }

    public function productTemplate($productID)
    {
        $product = $this->marketplaceModel->getProductByID($productID);

        echo $this->twig->render('/Page/product.html.twig', [
            'product' => $product
        ]);
    }

    public function addToCart($productID)
    {
        $this->marketplaceModel->addToCart($_SESSION['user']['id'], $productID);
        header("Location: /marketplace/product/$productID");
        exit;
    }

    public function removeFromCart($productID)
    {
        $this->marketplaceModel->deleteFromCart($_SESSION['user']['id'], $productID);
        header("Location: /marketplace/cart");
        exit;
    }

    public function cart()
    {
        $products = $this->marketplaceModel->eachProductFromCart($_SESSION['user']['id']);

        $total = 0;

        foreach($products as &$product) {
            $total += $product['price'];
        }
        echo $this->twig->render('/Page/cart.html.twig', [
            'products' => $products,
            'total' => $total
        ]);
    }

    public function marketplace()
    {
        $products = $this->marketplaceModel->eachProducts();

        $categories = [];

        foreach($products as &$product) {
            $categories[$product['category']][] = $product;
        }

        echo $this->twig->render('/Page/marketplace.html.twig', [
            'produts' => $products,
            'categories' => $categories
        ]);
    }

    public function information()
    {
        $user = $this->userModel->findOneByEmail($_SESSION['user']['email']);

        echo $this->twig->render('/Page/information.html.twig', [
            'user' => $user,
        ]);
    }

    public function recapitulatif()
    {
        $products = $this->marketplaceModel->eachProductFromCart($_SESSION['user']['id']);

        $total = 0;

        foreach ($products as $product) {
            $total += $product['price'];
        }

        echo $this->twig->render('/Page/recapitulatif.html.twig', [
            'data' => $_POST,
            'user' => $_SESSION['user'],
            'products' => $products,
            'total' => $total
        ]);
    }

    public function paiement()
    {
        echo $this->twig->render('/Page/paiement.html.twig', [
            'data' => $_GET,
        ]);
    }

    public function validate()
    {
        echo $this->twig->render('/Page/validate.html.twig');

        $products = $this->marketplaceModel->eachProductFromCart($_SESSION['user']['id']);

        $date = date('jmYHis');

        foreach ($products as $product) {
            $this->marketplaceModel->insertProductCommand($_SESSION['user']['id'], $product['id'], $date);
        }

        $this->marketplaceModel->deleteCart($_SESSION['user']['id']);
    }
}