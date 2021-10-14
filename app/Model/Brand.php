<?php

namespace App\Model;
use App\Model\Category;
use App\Model\Product;
use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    protected $guarded = [];

    public function products(){
        return $this->hasMany(Product::class);
    }
    
}
