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
 // Översikt över alla medlemmar
if(isset($_POST['medlemmar'])) {
    $sql = "SELECT medlem.name, avgift.avgift
    FROM pivot
    JOIN medlem ON medlem_id = medlem.id 
    JOIN avgift ON avgift_id = avgift.id
    WHERE 1";
    $sth = $dbh->prepare($sql);
    $sth->execute();
    $result = $sth->fetchAll();
    foreach($result AS $medlem) {
        echo $medlem['name'] .  " | Medlemsavgift: " . $medlem['avgift'] ."<br>";
    }
    
}
// översikt över alla som spelar fotboll
if(isset($_POST['fotboll'])) {
    $sql = "SELECT medlem.name, sports.sport, avgift.avgift
    FROM pivot
    JOIN medlem ON medlem_id = medlem.id
    JOIN sports ON sport_id = sports.id
    JOIN avgift ON avgift_id = avgift.id
    WHERE sport_id = 1";
    $sth = $dbh->prepare($sql);
    $sth->execute();
    $result = $sth->fetchAll();
    foreach($result AS $medlem) {
         echo $medlem['name'] . " - " . $medlem['sport'] . " | Medlemsavgift: " . $medlem['avgift'] . "<br>";
    }
  
 }
 // översikt över alla som åker skidor
 if(isset($_POST['skidor'])) {
    $sql = "SELECT medlem.name, sports.sport, avgift.avgift
    FROM pivot
    JOIN medlem ON medlem_id = medlem.id
    JOIN sports ON sport_id = sports.id
    JOIN avgift ON avgift_id = avgift.id
    WHERE sport_id = 2";
    $sth = $dbh->prepare($sql);
    $sth->execute();
    $result = $sth->fetchAll();
    foreach($result AS $medlem) {
         echo $medlem['name'] . " - " . $medlem['sport'] . " | Medlemsavgift: " . $medlem['avgift'] . "<br>";
    }
  
 }
 // översikt över alla som håller på med gymnastik
 if(isset($_POST['gymnastik'])) {
    $sql = "SELECT medlem.name, sports.sport, avgift.avgift 
    FROM pivot
    JOIN medlem ON medlem_id = medlem.id
    JOIN sports ON sport_id = sports.id
    JOIN avgift ON avgift_id = avgift.id
    WHERE sport_id = 3";
    $sth = $dbh->prepare($sql);
    $sth->execute();
    $result = $sth->fetchAll();
    foreach($result AS $medlem) {
         echo $medlem['name'] . " - " . $medlem['sport'] . " | Medlemsavgift: " . $medlem['avgift'] . "<br>";
    }
  
 }

} else {
    // om man inte har eller är inloggad så ska denna visas
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
