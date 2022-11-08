<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Artisan;
use Session;

class AuthController extends Controller
{
    
    public function createUser(Request $request)
    {
      
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required'
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);
        
        Auth::attempt($request->only(['email', 'password']));

        return redirect()->route('home')->with([
            'status' => true,
            'message' => 'User Registered In Successfully',
            'token' => $user->createToken("API TOKEN")->plainTextToken
        ]);

    }

   
    public function loginUser(Request $request)
    {
        
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        if (Auth::attempt($credentials)) {
                $user = User::where('email', $request->email)->first();
                $request->session()->regenerate();
        
                return redirect()->route('home')->with([
                'status' => true,
                'message' => 'User Logged In Successfully',
                'token' => $user->createToken("API TOKEN")->plainTextToken
            ]);
        }
        
        return redirect()->route('login')->with([
                'status' => false,
                'message' => 'Email & Password does not match with our record.',
        ]);

    }
}
