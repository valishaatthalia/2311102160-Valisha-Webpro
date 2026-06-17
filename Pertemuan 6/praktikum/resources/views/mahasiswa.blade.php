<!DOCTYPE html>
<html>
<head>
    <title>Praktikum AJAX Laravel 12</title>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <style>

        body{
            background:#f4f4f4;
            font-family:Arial;
            text-align:center;
        }

        h1{
            color:#2563eb;
            margin-top:60px;
        }

        button{
            padding:15px 30px;
            background:#2563eb;
            color:white;
            border:none;
            border-radius:10px;
            cursor:pointer;
            font-size:18px;
        }

        #data{
            margin-top:50px;
            display:flex;
            justify-content:center;
            gap:20px;
            flex-wrap:wrap;
        }

        .card{
            width:300px;
            background:white;
            padding:20px;
            border-radius:10px;
            box-shadow:0px 2px 5px rgba(0,0,0,0.2);
            text-align:left;
        }

    </style>
</head>
<body>

    <h1>Data Mahasiswa Praktikum</h1>

    <p>Implementasi Laravel 12 & AJAX tanpa Database</p>

    <button id="btnData">
        Tampilkan Data
    </button>

    <div id="data"></div>

<script>

$("#btnData").click(function(){

    $.ajax({

        url:'/mahasiswa',
        type:'GET',

        success:function(response){

            let html='';

            response.forEach(function(item){

                html += `
                <div class="card">
                    <h2>${item.nama}</h2>
                    <p>${item.nim}</p>
                    <hr>

                    <p><b>Kelas:</b> ${item.kelas}</p>
                    <p><b>Prodi:</b> ${item.prodi}</p>
                </div>
                `;
            });

            $("#data").html(html);
        }

    });

});

</script>

</body>
</html>