<h2>Login</h2>

@if(session('error'))
{{ session('error') }}
@endif

<form action="/auth" method="POST">
    @csrf

    Email :
    <input type="email" name="email">
    <br><br>

    Password :
    <input type="password" name="password">
    <br><br>

    <button type="submit">Login</button>
</form>

<br>

<a href="/registration">Belum punya akun? Register</a>