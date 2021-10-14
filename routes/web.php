<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::prefix('admin')->group(base_path('routes/admin.php'));
Route::prefix('user')->group(base_path('routes/user.php'));

Auth::routes();

Route::get('forget-password','UserController@forget_password');

Route::get('user-dashboard', 'HomeController@index');

Route::get('/', function () {
    return view('public.public_master');
});

Route::get('/admin', function () {
    return view('admin.admin_master');
});

Route::get('shop', 'HomeController@index');

Route::get('/user-login', 'HomeController@index');

Route::get('cart', 'HomeController@index');

Route::get('checkout', 'HomeController@index');

Route::get('wishlist', 'HomeController@index');

Route::get('/user-login', 'HomeController@index');

Route::get('order-details/{id}', 'HomeController@index'); 

Route::get('/user-login', 'HomeController@index')->name('login');

Route::group(['prefix' => 'cart'], function(){
    Route::post('add-to-cart', 'CartController@addToCart');
    Route::get('productList', 'CartController@productList')->name('productList');
    Route::get('remove-from-cart/{id}', 'CartController@removeFromCart')->name('removeFromCart');
    Route::post('update-cart', 'CartController@updateCart')->name('updateCart');
});

Route::post('checkout', 'OrderController@checkOut')->name('checkOut');

// Route::get('/user-login', 'HomeController@index')->name('login');

Route::get('product-list', 'ProductController@getAllProduct');

Route::get('product-sidebar-info', 'ProductController@sidebarInfo');

Route::get('product-filter/{data}', 'ProductController@productFilter');


// Route::get('/password.request', 'ForgotPasswordController@forgotPassword')->name('password.request');

Route::get('/{path}/id', function () {
    return view('public.public_master');
});