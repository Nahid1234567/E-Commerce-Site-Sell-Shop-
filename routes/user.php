<?php

use Illuminate\Support\Facades\Route;

Route::group(['middleware' => 'auth'], function(){

    Route::get('user-dashboard', 'HomeController@index');

    Route::get('shop', 'HomeController@index');

    Route::get('wishlist', 'HomeController@index');

    Route::resource('wishlist', 'WishListController');

    Route::resource('product', 'ProductController');

    Route::get('/user-login', 'HomeController@index')->name('login');

    Route::get('/', 'HomeController@authUser'); 

    Route::get('order-list', 'HomeController@orderList');

    Route::post('/deleteOrder/{id}', 'HomeController@deleteOrder');

    Route::get('order-detail/{id}', 'HomeController@orderDetail'); 

    Route::post('/multiple-order-delete', 'HomeController@multipleDelete')->name('user.order.multipledelete');

    Route::get('/change-user-password','HomeController@change_password')->name('change-user-password');

    Route::post('/update-user-password','HomeController@update_password')->name('update-user-password');

    // Route::get('/forget-password','HomeController@forget_password')->name('forget-password');
});

Route::get('/user-login', 'HomeController@index');

// Route::get('/forget-password','HomeController@forget_password')->name('forget-password');

Route::get('wishlist', 'WishListController@index');

Route::get('shop', 'HomeController@index');

Route::get('/{anypath}', 'HomeController@index');

