<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function privateUrls(){
        return view('user.private-urls');
    }

    public function urlList(){
        return view('admin.url-list');
    }

    public function urlDetailsList($id){
        return view('admin.url-details',compact('id'));
    }
}
