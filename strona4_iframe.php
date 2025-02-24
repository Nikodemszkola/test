<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zagrody</title>
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
            margin-left: 785px;
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid black;
        }
    </style>
</head>

<body>
    <?php
    require_once "dbconnect.php";
    $conn = mysqli_connect($host, $user, $pass, $db) or die("Błąd połączenia z bazą danych");


    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'add') {

        $insertQuery = "INSERT INTO zagroda (Idrolnika) VALUES (NULL)";
        if (mysqli_query($conn, $insertQuery)) {

        } else {
            echo "Błąd podczas dodawania zagrody: " . mysqli_error($conn);
        }
    }



    // Usuwanie zagrody
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'delete') {
        $idzagrody = mysqli_real_escape_string($conn, $_POST['idzagrody']);
        $deleteQuery = "DELETE FROM zagroda WHERE Idzagrody = '$idzagrody'";
        if (mysqli_query($conn, $deleteQuery)) {

        } else {
            echo "Błąd podczas usuwania zagrody: " . mysqli_error($conn);
        }
    }

    // Aktualizacja rolnika dla zagrody
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'update') {
        $idzagrody = mysqli_real_escape_string($conn, $_POST['idzagrody_update']);
        $newRolnik = mysqli_real_escape_string($conn, $_POST['new_rolnik']);

        $updateQuery = "UPDATE zagroda SET Idrolnika = '$newRolnik' WHERE Idzagrody = '$idzagrody'";
        if (mysqli_query($conn, $updateQuery)) {

        } else {
            echo "Błąd podczas aktualizacji: " . mysqli_error($conn);
        }
    }

    // Pobieranie danych z bazy
    $q = "SELECT * FROM zagroda";
    $result = mysqli_query($conn, $q);

    echo "<table>";
    echo "<thead>";
    echo "<tr>";
    echo "<th>Idzagrody</th>";
    echo "<th>Idrolnika</th>";
    echo "</tr>";
    echo "</thead>";
    echo "<tbody>";

    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . $row["Idzagrody"] . "</td>";
        echo "<td>" . ($row["Idrolnika"] ?? 'NULL') . "</td>";
        echo "</tr>";
    }

    echo "</tbody>";
    echo "</table>";

    mysqli_close($conn);
    ?>
</body>

</html>