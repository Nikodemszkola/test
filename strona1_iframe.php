<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <?php
    require_once "dbconnect.php";
    $conn = mysqli_connect($host, $user, $pass, $db) or die("błąd połączenia");


    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'add') {
        $imie = mysqli_real_escape_string($conn, $_POST['imie']);
        $nazwisko = mysqli_real_escape_string($conn, $_POST['nazwisko']);
        $pesel = mysqli_real_escape_string($conn, $_POST['pesel']);

        $insertQuery = "INSERT INTO Rolnicy (Imie, Nazwisko, Pesel) VALUES ('$imie', '$nazwisko', '$pesel')";
        mysqli_query($conn, $insertQuery);
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'delete') {
        $idRolnika = mysqli_real_escape_string($conn, $_POST['idrolnika']);

        $deleteQuery = "DELETE FROM Rolnicy WHERE Idrolnika = '$idRolnika'";
        mysqli_query($conn, $deleteQuery);
    }


    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'update') {
        $idRolnika = mysqli_real_escape_string($conn, $_POST['idrolnika_update']);
        $newImie = mysqli_real_escape_string($conn, $_POST['new_imie']);
        $newNazwisko = mysqli_real_escape_string($conn, $_POST['new_nazwisko']);


        $updateFields = [];
        if (!empty($newImie)) {
            $updateFields[] = "Imie = '$newImie'";
        }
        if (!empty($newNazwisko)) {
            $updateFields[] = "Nazwisko = '$newNazwisko'";
        }

        if (!empty($updateFields)) {
            $updateQuery = "UPDATE Rolnicy SET " . implode(", ", $updateFields) . " WHERE Idrolnika = '$idRolnika'";
            mysqli_query($conn, $updateQuery);
        }
    }


    $q = "SELECT * FROM Rolnicy";
    $result = mysqli_query($conn, $q);

    echo "<table>";
    echo "<thead>";
    echo "<tr>";
    echo "<th>Idrolnika</th>";
    echo "<th>Imie</th>";
    echo "<th>Nazwisko</th>";
    echo "<th>Pesel</th>";
    echo "</tr>";
    echo "</thead>";
    echo "<tbody>";

    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . $row["Idrolnika"] . "</td>";
        echo "<td>" . $row["Imie"] . "</td>";
        echo "<td>" . $row["Nazwisko"] . "</td>";
        echo "<td>" . $row["Pesel"] . "</td>";
        echo "</tr>";
    }

    echo "</tbody>";
    echo "</table>";

    mysqli_close($conn);
    ?>
</body>

</html>