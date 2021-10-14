<?php

namespace App\Http\Controllers;

use App\Model\Order;
use App\Model\Product;
use App\Model\OrderItem;
use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\Customer;
use Stripe\Charge;
use Stripe\Token;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
    
     */
    public function checkOut(Request $request)
    {
        $payment_type = $request->payment_type;

        if($payment_type === 'cash_on_delivery'){
            $this->orderProcess($request);
        }
        else if($payment_type === 'card_payment'){
            Stripe::setApiKey('sk_test_4eC39HqLyjWDarjtT1zdp7dc');
            $card = $request->cardInfo;
            $token = Token::create([
                'card' => [
                    'number' => $card['cardNumber'],
                    'exp_month' => $card['expMonth'],
                    'exp_year' =>  $card['expYear'],
                    'cvc' =>  $card['cvc']
                  ],
                ]);
            $email  = \Auth::user()->email;

            $customer = Customer::create([
                'email' => $email,
                'source'  => $token,
            ]);

            $charge = Charge::create([
                'customer' => $customer->id,
                'amount'   => \Cart::getTotal() * 100,
                'currency' => 'usd',
            ]);
            $this->orderProcess($request);

        }         
    }

    public function orderProcess($request){
        {
            $user = \Auth::user();
            $shipping_address = '';
                if($request->shipping_address){
                    $shipping_address = $request->shipping;
                }
                else{
                    $shipping_address = $user;
                }
                $payment_type = $request->payment_type;
           
            $total = \Cart::getTotal();
    
            $order = new Order();
            $order->user_id = $user->id;
            $order->shipping_address = json_encode($shipping_address);
            $order->payment_type = $payment_type;
            $order->total = $total;
            $order->sub_total = $total;
            $order->save();
    
            $items = \Cart::getContent();
           
            foreach($items as $row){
                $order_item = new OrderItem();
    
                $order_item->order_id = $order->id;
                $order_item->item_name = $row->name;
                $order_item->item_price = $row->price;
                $order_item->item_quantity = $row->quantity;
                $order_item->save();
            }
                \Cart::clear();           
        }
    }

    public function index(Request $request, $number = 10)   
    {  
         if(!$request->ajax()){
          return abort(404);
        }

        $orders = Order::latest()->paginate($number);
        return response()->json([
          'orders'=> $orders
        ]);
    }
 
    public function orderDetail(Request $request, $id)
    {   
        if(!$request->ajax()){
            return abort(404);
        }
        $single_order = Order::find($id);    
        return response()->json([
          'single_order' => $single_order
        ]);
    } 

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function edit(Order $order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $order)
    {
        $order->delete();
        return $this->index();
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
