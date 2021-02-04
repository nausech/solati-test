<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Client;

class ClientSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Client::create([
            'nit' => 1231321654,
            'name' => 'CAFAM',
            'email' => "cafam@cafam.com",
            "address" => "cra 1 # 2-3"
        ]);
        
        Client::create([
            'nit' => 54875131,
            'name' => 'Mundo mujer',
            'email' => "mundoMujer@mujer.com",
            "address" => "cra 4 # 2-3"
        ]); 
    }
}
