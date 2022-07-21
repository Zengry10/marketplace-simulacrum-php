<?php

require_once __DIR__ . './../vendor/autoload.php';

date_default_timezone_set('Europe/Paris');

session_start();

$router = new Bramus\Router\Router();

$router->before('GET|POST', '/register', function() {
    if (isset($_SESSION['user'])) {
        header('location: /');
        exit();
    }
});

$router->before('GET|POST', '/login', function() {
    if (isset($_SESSION['user'])) {
        header('location: /');
        exit();
    }
});

$router->before('GET|POST', '/account', function() {
    if (!isset($_SESSION['user'])) {
        header('location: /');
        exit();
    }
});

$router->get('/', 'Mvc\Controllers\PageController@base');

$router->all('/register', 'Mvc\Controllers\UserController@register');
$router->all('/login', 'Mvc\Controllers\UserController@login');
$router->get('/logout', 'Mvc\Controllers\UserController@logout');
$router->get('/account', 'Mvc\Controllers\UserController@account');

$router->get('/admin/location/delete/{id}', 'Mvc\Controllers\LocationController@locationDelete');
$router->all('/admin/location/create', 'Mvc\Controllers\LocationController@locationCreate');
$router->get('/admin/location', 'Mvc\Controllers\LocationController@locationList');
$router->get('/admin/location/parting', 'Mvc\Controllers\LocationController@parting');
$router->get('/admin/marketplace/delete/{id}', 'Mvc\Controllers\MarketplaceController@marketplaceDelete');
$router->all('/admin/marketplace/create', 'Mvc\Controllers\MarketplaceController@marketplaceCreate');
$router->get('/admin/marketplace', 'Mvc\Controllers\MarketplaceController@marketplaceList');
$router->get('/admin/marketplace/category/delete/{id}', 'Mvc\Controllers\MarketplaceController@marketplaceCategoryDelete');
$router->all('/admin/marketplace/category/create', 'Mvc\Controllers\MarketplaceController@marketplaceCategoryCreate');
$router->get('/admin/marketplace/category', 'Mvc\Controllers\MarketplaceController@marketplaceCategoryList');


$router->get('/location/information', 'Mvc\Controllers\LocationController@information');
$router->get('/location/house/{id}', 'Mvc\Controllers\LocationController@houseTemplate');

$router->get('/marketplace', 'Mvc\Controllers\MarketplaceController@marketplace');
$router->get('/marketplace/product/{id}', 'Mvc\Controllers\MarketplaceController@productTemplate');
$router->get('/marketplace/addToCart/{id}', 'Mvc\Controllers\MarketplaceController@addToCart');
$router->get('/marketplace/removeFromCart/{id}', 'Mvc\Controllers\MarketplaceController@removeFromCart');
$router->get('/marketplace/cart', 'Mvc\Controllers\MarketplaceController@cart');
$router->get('/marketplace/information', 'Mvc\Controllers\MarketplaceController@information');
$router->post('/marketplace/recapitulatif', 'Mvc\Controllers\MarketplaceController@recapitulatif');
$router->get('/marketplace/paiement', 'Mvc\Controllers\MarketplaceController@paiement');
$router->get('/marketplace/validate', 'Mvc\Controllers\MarketplaceController@validate');


$router->run();