<?php

use Illuminate\Support\Facades\Route;

Route::group(['middleware' => 'auth:admin'], function(){

Route::get('/', function () {
    return view('admin.admin_master');
})->name('admin.dashboard');

Route::get('user', function (){

     return response()->json([
    'admin' => \Auth::guard('admin')->user(),

    ]);   
});
//Category Related Routes
Route::resource('category', 'CategoryController');
Route::post('/multiple-category-delete', 'CategoryController@multipleDelete')->name('admin.category.multipledelete');
Route::get('/all-category', 'CategoryController@getAllCategory')->name('admin.all-category');

//Brand Related Routes
Route::resource('brand', 'BrandController');
Route::post('/multiple-brand-delete', 'BrandController@multipleDelete')->name('admin.brand.multipledelete');
Route::get('/all-brand', 'BrandController@getAllBrand')->name('admin.all-brand');

//Product Related Routes
Route::resource('product', 'ProductController');
Route::post('/multiple-product-delete', 'ProductController@multipleDelete')->name('admin.product.multipledelete');
Route::post('/product-update/{id}', 'ProductController@updateProduct')->name('admin.product.update');

//Order Related Routes
Route::resource('order', 'OrderController');
Route::post('/deleteOrder/{id}', 'OrderController@deleteOrder');
Route::post('/multiple-order-delete', 'OrderController@multipleDelete')->name('admin.order.multipledelete');
Route::get('order-detail/{id}', 'OrderController@orderDetail');

////Customer Related Routes
Route::get('/user-list', 'HomeController@userList')->name('admin.user.list');

//Logout Routes
Route::get('/logout', 'Admin\LoginController@logout')->name('admin.logout');

Route::get('/change-admin-password','HomeController@change_admin_password')->name('change-admin-password');

Route::post('/update-admin-password','HomeController@update_admin_password')->name('update-admin-password');

});

//Login Routes

Route::get('/login', 'Admin\LoginController@showLoginForm')->name('admin.login'); 

Route::post('/login', 'Admin\LoginController@login')->name('admin.login.post');  












//All the login Routes


Route::get('/{path}', function () {
    return view('admin.admin_master');
});

Route::get('/{path}/{id}', function () {
    return view('admin.admin_master');
});


