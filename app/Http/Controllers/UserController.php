<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    public function forget_password(){

        return view('auth.forget_password');
    }
}
