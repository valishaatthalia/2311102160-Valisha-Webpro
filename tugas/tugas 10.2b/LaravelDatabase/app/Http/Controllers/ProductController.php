<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product; // Import model Product

class ProductController extends Controller
{
    public function index()
    {
        // Gunakan fungsi with('variants') untuk memanggil relasi
        $prods = Product::with('variants')->get();
        
        // Pengkondisian untuk output API (JSON)
        if (request()->segment(1) == 'api') {
            return response()->json([
                'error' => false,
                'list' => $prods,
            ]);
        }

        // Output untuk tampilan Web/Blade
        return view('view_product', [
            'title' => 'Daftar Produk',
            'data' => $prods,
        ]);
    }
    
    // ... method lain seperti create, store, dll (biarkan seperti aslinya)
}