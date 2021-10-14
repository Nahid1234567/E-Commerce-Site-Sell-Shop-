<?php

namespace App\Http\Controllers;

use App\Model\WishList;
use Illuminate\Http\Request;

class WishListController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {   
        $user_id = \Auth::guard('web')->user()->id;
        $wishlists = WishList::latest()->where('user_id', $user_id)->paginate(10);
        return response()->json([
          'wishlists'=> $wishlists
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
        $product_id = WishList::find($request->input('product_id'));
        $user_id = \Auth::user()->id;
        $dublicate = WishList::where([
            ['product_id', $request['product_id']],
            ['user_id', $request['user_id']],         
        ])->first();

        if($dublicate){
          dd('ok');
        }
        else{
        $wishlist = new WishList();
        $wishlist = $wishlist->create($request->all());
        return response()->json($wishlist);
        }     
      
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\WishList  $wishList
     * @return \Illuminate\Http\Response
     */
    public function show(WishList $wishList)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\WishList  $wishList
     * @return \Illuminate\Http\Response
     */
    public function edit(WishList $wishList)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\WishList  $wishList
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, WishList $wishList)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\WishList  $wishList
     * @return \Illuminate\Http\Response
     */
    public function destroy(WishList $wishlist)
    {
        $wishlist->delete();
        return $this->index();
    }
}
