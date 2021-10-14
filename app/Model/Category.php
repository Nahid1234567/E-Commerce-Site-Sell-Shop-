<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use App\Model\Product;
use App\Model\Brand;

class Category extends Model
{
    protected $guarded = [];


    public function products(){
      return $this->hasMany(Product::class);
    }
}
