<?php

use Illuminate\Database\Seeder;
use App\Model\Admin;
use App\Model\Category;
use App\Model\Brand;
use App\Model\Product;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        factory(Admin::class,1)->create();
    }
}

