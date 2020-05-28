<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>labb2</title>
</head>
<body>
    <center>
        <h2>IK Svalan</h2>
    </center>
    
</body>
</html>
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

    // kollar om användaren finns
    if($result[0]['user_id'] > 0) {
        $_SESSION['checkLogin'] = 1;
    } else {
        echo "<p>Fel lösenord eller email</p>";
    }
    

}   
    // kollar om användaren är inloggad
if($_SESSION['checkLogin'] == 1) {
    ?>
        <form method="post"> 
            <input type="submit" value="Logout" name="logout">
        </form>
    <?php
    if(isset($_POST['logout'])) {
        session_destroy();
        echo "<p>Utloggad!</p>";
    }

// lägger till 3st sporter
?>
    <form method="post">
        <input type="submit" value="Fotboll" name="fotboll">
    </form>

    <form method="post">
        <input type="submit" value="Skidor" name="skidor">
    </form>

    <form method="post">
        <input type="submit" value="Gymnastik" name="gymnastik">
    </form>

    <form method="post">
        <input type="submit" value="Medlemmar" name="medlemmar">
    </form>
<?php 

// Om fotboll är valt ||||| Lägg till så att man kollar om användaren är admin och äre så så ska en redigera knapp komma upp, antingen vid alla medlemmar eller vid varje sport så-
// man kan lägga till, tabort eller redigera medlemmar. 
if(isset($_POST['fotboll'])) {
    $sql = "SELECT name FROM login WHERE sport = fotboll";
    $sth = $dbh->prepare($sql);
    $sth->execute(['sport' => 'fotboll']);
    $result = $sth->fetchAll();
    var_dump($result[0]);
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
