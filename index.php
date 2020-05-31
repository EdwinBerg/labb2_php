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
            <input type="submit" value="Logout" name="logout"> <br><br>
        </form>
    <?php
    if(isset($_POST['logout'])) {
        session_destroy();
        echo "<p>Utloggad!</p>";
    } 

 // lägg till medlem
 ?>
 <div style="float: right;">
 <form method="post">
     <div>
         <h3>Lägg till ny medlem</h3>
        <input name="newMember" placeholder="Skriv in ny medlem">
         <input type="submit" value="Lägg till" name="addMember">
     </div>
     </form>
    <br><br>

<!-- tabort medlem -->
     <div>
        <h3>Ta bort medlem</h3>
        <form method="post">
            <label for="medlem">Medlem:</label>
            <select id="medlem" name="member">

                <?php
                    $sql = "SELECT * FROM medlem";
                    $sth = $dbh->prepare($sql);
                    $sth-> execute();
                    $result = $sth->fetchAll();
                    foreach($result as $medlem) {
                        echo "<option value=\"" . $medlem['id'] . "\">" . $medlem['name'] . "</option>";
                    }
                ?>
            </select>
            <input type="submit" value="Ta bort" name="removeMember">
        </form>
     </div>
     <br><hr style="width: 100%;"><br>

<!-- lägg till ett lag-->
     <div>
    <form method="post">
        <h3>Lägg till ett lag</h3>
        <input name="newTeam" placeholder="Skriv in nytt lag">
        <input type="submit" value="Lägg till" name="addTeam">
     </form>
     </div>
    <br><br>

<!-- tabort ett lag -->
     <div>
        <h3>Ta bort ett lag</h3>
        <form method="post">
            <label for="lag">Lag:</label>
            <select id="lag" name="teamChosen">

                <?php
                    $sql = "SELECT * FROM lag";
                    $sth = $dbh->prepare($sql);
                    $sth-> execute();
                    $result = $sth->fetchAll();
                    foreach($result as $lag) {
                        echo "<option value=\"" . $lag['lag'] . "\">" . $lag['lag'] . "</option>";
                    }
                ?>
            </select>
            <input type="submit" value="Ta bort" name="removeTeam">
        </form>
    </div>
    <br><hr style="width: 100%;"><br>

    <!-- uppdatera medlem -->
    <div>
    <form method="post">
        <h3>Uppdatera en medlem</h3>
        <label for="medlem">Medlem:</label>
            <select id="medlem" name="member">

                <?php
                    $sql = "SELECT * FROM medlem";
                    $sth = $dbh->prepare($sql);
                    $sth-> execute();
                    $result = $sth->fetchAll();
                    foreach($result as $medlem) {
                        echo "<option value=\"" . $medlem['name'] . "\">" . $medlem['name'] . "</option>";
                    }
                ?>
            </select> <br>
        <label for="lag">Lag:</label>
            <select id="lag" name="teamChosen">

                <?php
                    $sql = "SELECT * FROM lag";
                    $sth = $dbh->prepare($sql);
                    $sth-> execute();
                    $result = $sth->fetchAll();
                    foreach($result as $lag) {
                        echo "<option value=\"" . $lag['lag'] . "\">" . $lag['lag'] . "</option>";
                    }
                ?>
            </select> <br>
            <label for="lag">Sport:</label>
            <select id="lag" name="sportChosen">

                <?php
                    $sql = "SELECT * FROM sports";
                    $sth = $dbh->prepare($sql);
                    $sth-> execute();
                    $result = $sth->fetchAll();
                    foreach($result as $sport) {
                        echo "<option value=\"" . $sport['sport'] . "\">" . $sport['sport'] . "</option>";
                    }
                ?>
            </select> <br>

            <label for="lag">Medlemsavgift:</label>
            <select id="lag" name="medlemsavgift">

                <?php
                    $sql = "SELECT * FROM avgift";
                    $sth = $dbh->prepare($sql);
                    $sth-> execute();
                    $result = $sth->fetchAll();
                    foreach($result as $sport) {
                        echo "<option value=\"" . $sport['avgift'] . "\">" . $sport['avgift'] . "</option>";
                    }
                ?>
            </select> <br> <br>
        <input type="submit" value="Lägg till" name="addToPivot">
        <input type="submit" value="Uppdatera" name="update">
        <input type="submit" value="Ta bort" name="removeFromPivot">
    </form> 
    </div>
    <br><hr style="width: 100%;"><br>
 </div>
 <?php 
 
 //lägger till en medlem
 if(isset($_POST['addMember'])) {
     $newMember = $_POST['newMember'];
     $sql = "INSERT INTO medlem (name) VALUES (:name)";
     $sth = $dbh->prepare($sql);
     $sth->execute([':name' => $newMember]);
     $result = $sth->fetchAll();
     echo "<center><p> " . $newMember . " har lagts till!</p></center>";
 }
// ta bort en medlem
 if(isset($_POST['removeMember'])) {
    $removeMember = $_POST['member'];
    $name = "SELECT * FROM medlem WHERE id = $removeMember";
    $namesth = $dbh->prepare($name);
    $namesth->execute();
    $resultName =  $namesth->fetchAll();
    $sql = "DELETE FROM medlem WHERE id = :id";
    $sth = $dbh->prepare($sql);
    $sth->execute([':id' => $removeMember]);
    $result = $sth->fetchAll();
    echo "<center><p> " . $resultName[0]["name"] . " har tagits bort!</p></center>";
}

// lägg till ett lag 
if(isset($_POST['addTeam'])) {
    $newTeam = $_POST['newTeam'];
    $sql = "INSERT INTO lag (lag) VALUES (:lag)";
    $sth = $dbh->prepare($sql);
    $sth->execute([':lag' => $newTeam]);
    $result = $sth->fetchAll();
    echo "<center><p> " . $newTeam . " har lagts till!</p></center>";
}

// ta bort ett lag 
if(isset($_POST['removeTeam'])) {
    $removeTeam = $_POST['teamChosen'];
    $sql = "DELETE FROM lag WHERE lag = :lag";
    $sth = $dbh->prepare($sql);
    $sth->execute([':lag' => $removeTeam]);
    $result = $sth->fetchAll();
    echo "<center><p> " . $removeTeam . " har tagits bort!</p></center>";
}
// ###########################################################################
// uppdatera en medlem
if(isset($_POST['update'])) {
    $sql = "SELECT medlem.name, medlem.id, avgift.avgift
    FROM pivot
    JOIN medlem ON medlem_id = medlem.id
    JOIN avgift ON avgift_id = avgift.id
    WHERE 1";
    $sth = $dbh->prepare($sql);
    $sth->execute();
    $result = $sth->fetchAll();
    foreach($result AS $medlem) {
        echo $medlem['name'] .  " | Medlemsavgift: " . $medlem['avgift'] . " | Användar id: " . $medlem['id'] . "<br>";
    }
   
}
// ###########################################################################
// lägger till 3st sporter
?>
    <form method="post">
        <div>
            <input type="submit" value="Fotboll" name="fotboll">
        </div>

        <div>
            <input type="submit" value="Skidor" name="skidor">
        </div>

        <div>
            <input type="submit" value="Gymnastik" name="gymnastik">
        </div>

        <div>
            <input type="submit" value="Medlemmar" name="medlemmar">
        </div>
    </form>
<?php 
 // Översikt över alla medlemmar
if(isset($_POST['medlemmar'])) {
    $sql = "SELECT medlem.name, medlem.id, avgift.avgift
    FROM pivot
    JOIN medlem ON medlem_id = medlem.id
    JOIN avgift ON avgift_id = avgift.id
    WHERE 1";
    $sth = $dbh->prepare($sql);
    $sth->execute();
    $result = $sth->fetchAll();
    foreach($result AS $medlem) {
        echo $medlem['name'] .  " | Medlemsavgift: " . $medlem['avgift'] . " | Användar id: " . $medlem['id'] . "<br>";
    }
   
}

// översikt över alla som spelar fotboll
if(isset($_POST['fotboll'])) {
    $sql = "SELECT medlem.name, sports.sport, avgift.avgift, lag.lag
    FROM pivot
    JOIN medlem ON medlem_id = medlem.id
    JOIN sports ON sport_id = sports.id
    JOIN avgift ON avgift_id = avgift.id
    JOIN lag ON lag_id = lag.id
    WHERE sport_id = 1";
    $sth = $dbh->prepare($sql);
    $sth->execute();
    $result = $sth->fetchAll();
    foreach($result AS $medlem) {
         echo $medlem['name'] . " - " . $medlem['sport'] . " | Lag: " . $medlem['lag'] . " | Medlemsavgift: " . $medlem['avgift'] . "<br>";
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
        <input type="email" placeholder="Skriv in email" name="email">
        <input type="password" placeholder="Skriv in lösenord" name="password">
        <input type="submit" value="Login" name="login">
    </form>
    <?php
}

?>
