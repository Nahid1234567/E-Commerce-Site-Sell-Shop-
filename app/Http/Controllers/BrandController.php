<?php

namespace App\Http\Controllers;
use App\Model\Brand;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    
    public function index()
    {
        $brands = Brand::latest()->paginate(10);
        return response()->json([
          'brands' => $brands
        ]); 
       
    }
    public function deleteBrand($id)
    {
        $brand = Brand::find($id)->delete();     
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
    public function store(Request $request) {
        $request->validate([
            'name' => 'required'
        ]);
        Brand::create($request->all());
    }

    public function multipleDelete(Request $request) {
      foreach($request->all() as $brand){
         Brand::find($brand['id'])->delete();
        }
        
    }

    public function getAllBrand(){
        $brands = Brand::all();
        return response()->json([
          'brands' => $brands
        ]);       
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Brand  $Brand
     * @return \Illuminate\Http\Response
     */
    public function show(Brand $brand)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Brand  $Brand
     * @return \Illuminate\Http\Response
     */
    public function edit(Brand $brand)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Brand  $Brand
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Brand $brand)
    {
        $request->validate([
            'name' => 'required'
        ]);

        $brand->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Brand  $Brand
     * @return \Illuminate\Http\Response
     */
    public function destroy(Brand $brand)
    {
        $brand->delete();
        return $this->index();
    }
}
