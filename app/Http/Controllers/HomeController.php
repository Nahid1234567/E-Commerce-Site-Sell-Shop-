<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Model\OrderItem;
use App\Model\Order;
use App\Model\Product;
use Hash;
use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(){
      
        return view('public.public_master');
    }


    public function change_password(){
      
        return view('ChangePassword');
    }

    public function change_admin_password(){
      
        return view('ChangeAdminPassword');
    }

    public function update_password(Request $request){
        if((!Hash::check($request->get('current_pass'),\Auth::user()->password))){
            return back()->with('error','Your current password does not match with what you provided!');
        }

        if(strcmp($request->get('current_pass'), $request->get('new_pass')) == 0){
            return back()->with('error','Your new password can not be same as your current password!');
        }

        if(strcmp($request->get('new_pass'), $request->get('confirm_pass')) == 1){
            return back()->with('error','Your confirtmation password is not matching with your new password!');
        }

        $request->validate([
            'current_pass'=>'required',
            'new_pass'=>'required|string|min:8|max:20'
        ]);

        $user = \Auth::user();
        $user->password = bcrypt($request->get('new_pass'));
        $user->save();
        return redirect()->route('login')->with('message','Your password have changed successfully!.. Now can login with your new password');
      
    }

    public function update_admin_password(Request $request){
        if((!Hash::check($request->get('current_pass'),\Auth::user()->password))){
            return back()->with('error','Your current password does not match with what you provided!');
        }

        if(strcmp($request->get('current_pass'), $request->get('new_pass')) == 0){
            return back()->with('error','Your new password can not be same as your current password!');
        }

        if(strcmp($request->get('new_pass'), $request->get('confirm_pass')) == 1){
            return back()->with('error','Your confirtmation password is not matching with your new password!');
        }

        $request->validate([
            'current_pass'=>'required',
            'new_pass'=>'required|string|min:8|max:20'
        ]);

        $user = \Auth::user();
        $user->password = bcrypt($request->get('new_pass'));
        $user->save();
        return redirect()->route('admin.login')->with('message','Your password have changed successfully!.. Now can login with your new password');
      
    }


    

    public function authUser()
    {
        return response()->json([
            'user'=> \Auth::user()
        ]);   
    }

    public function userList()
    {   
        $user_list = User::latest()->paginate(10);
        return response()->json([
            'user_list' => $user_list
        ]);   
    }

    public function orderDetail(Request $request, $id)
    {   
        if(!$request->ajax()){
            return abort(404);
        }
        $user_single_order = Order::find($id);    
        return response()->json([
          'user_single_order' => $user_single_order
        ]);
    }

    public function orderList(Request $request, $number = 10)   
    {  
         if(!$request->ajax()){
          return abort(404);
        }

        $orders = Order::latest()->where('user_id', \Auth::user()->id)->paginate($number);
        return response()->json([
          'orders' => $orders
        ]);
    }

    public function deleteOrder($id)
    {
        $order = Order::find($id)->delete();     
    }

    public function multipleDelete(Request $request) {
        foreach($request->all() as $order){
           Order::find($order['id'])->delete();
        }          
    }
}
