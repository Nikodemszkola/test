<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zwierzeta</title>

</head>
<style>
    th,
    td {
        padding: 8px;
        text-align: left;
        width: 130px;


    }

    th {
        background-color: mediumaquamarine;
    }

    td {
        background-color: olive;
        font-size: large;
        color: pink;
    }

    table {
        margin-left: 500px;
        border-collapse: collapse;

    }

    table,
    th,
    td {
        border: 1px solid black;

    }
</style>

<body>
    <?php
    require_once "dbconnect.php";
    $conn = mysqli_connect($host, $user, $pass, $db) or die("Błąd połączenia z bazą danych");


    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'add') {
        $id_zagrody = mysqli_real_escape_string($conn, $_POST['IdZagrody']);
        $gatunek = mysqli_real_escape_string($conn, $_POST['gatunek']);
        $rasa = mysqli_real_escape_string($conn, $_POST['rasa']);
        $waga = mysqli_real_escape_string($conn, $_POST['waga']);
        $plec = mysqli_real_escape_string($conn, $_POST['plec']);

        $insertQuery = "INSERT INTO zwierzeta (IdZagrody, Gatunek, Rasa, Waga_kg, Plec) VALUES ('$id_zagrody', '$gatunek', '$rasa', '$waga', '$plec')";
        if (mysqli_query($conn, $insertQuery)) {

        } else {
            echo "Błąd podczas dodawania: " . mysqli_error($conn);
        }
    }


    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'delete') {
        $idzwierzecia = mysqli_real_escape_string($conn, $_POST['idzwierzecia']);
        $deleteQuery = "DELETE FROM zwierzeta WHERE Idzwierzecia = '$idzwierzecia'";
        if (mysqli_query($conn, $deleteQuery)) {

        } else {
            echo "Błąd podczas usuwania: " . mysqli_error($conn);
        }
    }


    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'update') {
        $idzwierzecia = mysqli_real_escape_string($conn, $_POST['idzwierzecia_update']);
        $newZagroda = mysqli_real_escape_string($conn, $_POST['new_zagroda']);

        $updateFields = [];
        if (!empty($newZagroda)) {
            $updateFields[] = "IdZagrody = '$newZagroda'";
        }

        if (!empty($updateFields)) {
            $updateQuery = "UPDATE zwierzeta SET " . implode(", ", $updateFields) . " WHERE Idzwierzecia = '$idzwierzecia'";
            if (mysqli_query($conn, $updateQuery)) {

            } else {
                echo "Błąd podczas aktualizacji: " . mysqli_error($conn);
            }
        }
    }


    $q = "SELECT * FROM zwierzeta";
    $result = mysqli_query($conn, $q);


    echo "<table>";
    echo "<thead>";
    echo "<tr>";
    echo "<th>Idzwierzecia</th>";
    echo "<th>IdZagrody</th>";
    echo "<th>Gatunek</th>";
    echo "<th>Rasa</th>";
    echo "<th>Waga_kg</th>";
    echo "<th>Plec</th>";
    echo "</tr>";
    echo "</thead>";
    echo "<tbody>";

    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . $row["Idzwierzecia"] . "</td>";
        echo "<td>" . $row["IdZagrody"] . "</td>";
        echo "<td>" . $row["Gatunek"] . "</td>";
        echo "<td>" . $row["Rasa"] . "</td>";
        echo "<td>" . $row["Waga_kg"] . "</td>";
        echo "<td>" . $row["Plec"] . "</td>";
        echo "</tr>";
    }

    echo "</tbody>";
    echo "</table>";

    mysqli_close($conn);
    ?>
</body>

</html>