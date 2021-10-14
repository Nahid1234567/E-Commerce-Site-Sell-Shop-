<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class WishList extends Model
{
    protected $guarded = [];
    
    protected $with = ['product'];   
    
    public function product(){
        return $this->belongsTo(Product::class);
    }
}

