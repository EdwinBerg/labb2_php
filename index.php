<?php
session_start();
//session_destroy();
// Slå på all felrapportering. Bra under utveckling, dåligt i produktion.
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$dbh = new PDO('mysql:dbname=labb2;host=localhost', 'admin', 'admin123');

// kolla om någon försöker logga in
if(isset($_POST['login'])) {

    $sql = "SELECT user_id FROM login WHERE email = :email AND password = :password";
    $sth = $dbh->prepare($sql);
    $sth->execute([':email' => $_POST['email'], ':password' => $_POST['password']]);
    $result = $sth->fetchAll();

    if($result[0]['user_id'] > 0) {
        echo "<p>Inloggad!</p>";
        $_SESSION['checkLogin'] = 1;
    } else {
        echo "<p>Fel lösenord eller email</p>";
    }
}   
    
if($_SESSION['checkLogin'] == 1) {
    // visa alla medlemmar och gör en logga ut knapp
    ?>
        <form method="post"> 
            <input type="submit" value="Logout" name="logout">
        </form>
    <?php
    if(isset($_POST['logout'])) {
        session_destroy();
        echo "<p>Utloggad!</p>";
    }



} else {
    ?>
    <form method="post">
        <h2>Logga in </h2>
        <input type="text" placeholder="Skriv in email" name="email">
        <input type="password" placeholder="Skriv in lösenord" name="password">
        <input type="submit" value="Login" name="login">
    </form>
    <?php
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>labb2</title>
</head>
<body>
    
</body>
</html>