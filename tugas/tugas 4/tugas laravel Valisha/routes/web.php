<?php

use Illuminate\Support\Facades\Route;

Route::get('/lat1', function () {
    return "
        <h3>Nama : Valisha</h3>
        <h3>Asal : Bengkulu</h3>
    ";
});

Route::get('/lat1/m2', function () {
    return "
        <center>
            <h2>Daftar Mahasiswa</h2>

            <table border='1' cellpadding='5'>
                <tr>
                    <th>No</th>
                    <th>Nama</th>
                    <th>Asal</th>
                </tr>

                <tr>
                    <td>1</td>
                    <td>Valisha</td>
                    <td>Bengkulu</td>
                </tr>

                <tr>
                    <td>2</td>
                    <td>Najwa</td>
                    <td>Bukittinggi</td>
                </tr>

                <tr>
                    <td>3</td>
                    <td>Regina</td>
                    <td>Lombok</td>
                </tr>
            </table>
        </center>
    ";
});