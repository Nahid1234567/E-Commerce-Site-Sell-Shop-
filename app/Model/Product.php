<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use App\Model\Category;
use App\Model\Brand;
use App\Model\Product;
class Product extends Model
{  
   protected $guarded = [];
   
    
   protected $with = ['category', 'brand'];
   
   protected $casts = [
     'size' => 'json',
     'color'=> 'json'
   ];

   public function category(){
     return $this->belongsTo(Category::class);
   }
   public function brand(){
     return $this->belongsTo(Brand::class);
   }
}

 