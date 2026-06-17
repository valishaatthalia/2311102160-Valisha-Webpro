<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MahasiswaController extends Controller
{
    public function index()
    {
        return view('mahasiswa');
    }

    public function getData()
    {
        $mahasiswa = [
            [
                'nama' => 'Valisha Atthalia Naura Irfan',
                'nim' => '231102160',
                'kelas' => 'IF-11-D',
                'prodi' => 'S1 Teknik Informatika'
            ],
            [
                'nama' => 'Religita Nur Hidayati',
                'nim' => '2311102025',
                'kelas' => 'IF-11-D',
                'prodi' => 'S1 Teknik Informatika'
            ],
            [
                'nama' => 'Najwa Humairah',
                'nim' => '2311102134',
                'kelas' => 'IF-11-D',
                'prodi' => 'S1 Teknik Informatika'
            ]
        ];

        return response()->json($mahasiswa);
    }
}