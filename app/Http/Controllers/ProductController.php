<?php

namespace App\Http\Controllers;
use App\Model\Product;
use App\Model\Brand;
use App\Model\Category;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    

    public function index($number=10)
    {
        $products = Product::latest()->paginate($number);
        return response()->json([
          'products'=> $products
        ]);
    }

    public function deleteProduct($id)
    {
        $product = Product::find($id)->delete();     
    }

    public function multipleDelete(Request $request) {
        foreach($request->all() as $product){
           Product::find($product['id'])->delete();
        }          
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
         $request->validate([
               'name' => 'required',
               'category_id' => 'required',
               'brand_id' => 'required',
               'price' => 'required|integer',
               'image' => 'required|mimes:jpg,png,jpeg,svg|max:1024',
               'description' => 'required',
               'quantity' => 'required|integer'

         ],
         [
               'category_id.required' => 'The Category Field Is Required',
               'brand_id.required' => 'The Brand Field Is Required',
               'quantity.required' => 'Quantity must be an integer number',
               'price.required' => 'Price must be an integer or fraction number'
         ]);

        $request['size'] = explode(',', $request->size);
        $request['color'] = explode(',', $request->color);
    
        $file = '';
        $upload_path = public_path('uploads');

        if($request->hasFile('image')){;
          $file = $request->file('image');
          $name = time()."_".$file->getClientOriginalName(); 
          $file->move($upload_path, $name);
        }

       
        $product = new Product();
        $product->create(array_merge($request->all(), ['image' => $name]));
    }

    /**
     * Display the specified resource.
     * 
     * @param  \App\Model\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        return response()->json([
          'product'=> $product 
        ]);
    }
    
    public function productFilter($data)
    {    
        $data = json_decode($data);
        $field = $data->field;
        $data = $data->data;

        if($field === 'price'){
            $products = $this->priceRangeFilter($data);
        }else if($field === 'size' || $field === 'color'){
            $products = $this->sizeOrColorFilter($data, $field);
        }
        else if($field === 'category_id' || $field === 'brand_id'){
            $products = Product::where($field, $data)->paginate(15);
        }
        else{
            $products = $this->index(15);
        }

        return response()->json([
          'products'=> $products 
        ]);
    }

    public function priceRangeFilter($data)
    {    
        $min = $data['0'];
        $max = $data['1'];

        $products = Product::whereBetween('price',[$min, $max])->paginate(15);
        
        return $products;
          
    }

    public function updateProduct(Request $request, $id)
    {
        $product = Product::findOrfail($id);
        $this->productValidation($request, $id);

        $request['size'] = explode(',', $request->size);
        $request['color'] = explode(',', $request->color);
        
        $file = '';
        $upload_path = public_path('uploads');

        if($request->hasFile('image')){
          $file = $request->file('image');
          $name = time()."_".$file->getClientOriginalName();
          $file->move($upload_path, $name);
          $image = public_path("uploads/$product->image");
          if(file_exists($image)){
              @unlink($image);
          }
        }
        else{
          $name = $product->image;
        }
      
        $product->create(array_merge($request->all(), ['image' => $name]));
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $product->delete();
        return $this->index();
    }

    public function productValidation($request, $id = null)
     {   
        if($id){
            $image = '';
        }else{
            $image = 'required|image|max:1024';
        }    
            $request->validate([
                'name' => 'required',
                'category_id' => 'required',
                'brand_id' => 'required',
                'price' => 'required|integer',
                'image' =>  $image,
                'description' => 'required',
                'quantity' => 'required|integer'

            ],
            [
                'category_id.required' => 'The Category Field Is Required',
                'brand_id.required' => 'The Brand Field Is Required',
                'quantity.required' => 'Quantity must be an integer number',
                'price.required' => 'Price must be an integer or fraction number'
            ]
        );
    }

    public function getAllProduct(){

        if(!\Request::ajax()){
            return abort(404);
        }

        return $this->index(15);
    }

    public function sidebarInfo()
    {
        $categories = Category::all();
        $brands = Brand::all();
        $min_price = Product::min('price');
        $max_price = Product::max('price');
        return response()->json([
          'brands'=> $brands,
          'categories'=> $categories,
          'price'=> [
              'min'=>$min_price,
              'max'=>$max_price
          ]
        ]);
    }

    public function sizeOrColorFilter($data, $field){

        $products = Product::query()->where($field, 'like', "%{$data}%")->paginate(15);
        return $products;
    }

}
