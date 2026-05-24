<h2>Registration</h2>

@if(session('success'))
{{ session('success') }}
@endif

<form action="/register" method="POST">
    @csrf

    Nama :
    <input type="text" name="name">
    <br><br>

    Email :
    <input type="email" name="email">
    <br><br>

    Password :
    <input type="password" name="password">
    <br><br>

    <button type="submit">Register</button>
</form>

<br>

<a href="/login">Kembali ke Login</a>