<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Client;

class ClientController extends Controller
{
    //index function
    public function index (){

        $clients = Client::all();

        return $this->showAll($clients, 201);

    }
    //show function
    public function show($client){
        
        $client = Client::findOrFail($client);

        return $this->showOne($client, 201);

    }
    //store function
    public function store(Request $request){

        try{
        $rules = [
            'nit'       => 'required|unique:clients',
            'name'      => 'required|string',
            'email'     => 'required|string|email|unique:clients',
            'address'   => 'required|string'
        ];

        $this->validate($request, $rules);

        $client = Client::create([
            'nit'       =>  $request->nit,
            'name'      =>  $request->name,
            'email'     =>  $request->email,
            'address'   =>  $request->address,
        ]);

        return $this->successResponse(['data' => $client, 'message'=> 'Client created!'], 201);
        }catch(\Exception $e){
            return $this->errorResponse("Error ".$e, 500);
        }

    }
    //update function
    public function update(Request $request, Client $client){

        try{
            $rules = [
                'nit'       => 'required',
                'name'      => 'required|string',
                'email'     => 'required',
                'address'   => 'required|string'
            ];

            $this->validate($request, $rules);

            $client->nit        = $request->nit;
            $client->name       = $request->name;
            $client->email      = $request->email;
            $client->address    = $request->address;
            $client->save();

            return $this->successResponse(['data'=> $client, 'message'=>"Client updated"],201);

        }catch(\Exeption $e){
            return $this->errorResponse("Error ".$e, 500);
        }
    }

    //destroy register 
    public function destroy(Client $client){
        $client->delete();
        return $this->successResponse(['data'=> $client, 'message'=>"Client deleted"],201);
    }
}
