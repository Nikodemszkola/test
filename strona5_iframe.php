<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zwierzeta</title>
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
            margin-left: 725px;
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

    // Połączenie z bazą danych
    $conn = mysqli_connect($host, $user, $pass, $db);
    if (!$conn) {
        die("Błąd połączenia z bazą danych: " . mysqli_connect_error());
    }

    // Obsługa dodawania nowego rekordu
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'add') {
        $rozmiar = mysqli_real_escape_string($conn, $_POST['rozmiar']);
        $gleba = mysqli_real_escape_string($conn, $_POST['gleba']);

        // Zapytanie SQL do dodania rekordu
        $insertQuery = "INSERT INTO pola (Rozmiar_ha, Rodzaj_gleby) VALUES ('$rozmiar', '$gleba')";
        if (mysqli_query($conn, $insertQuery)) {

        } else {
            echo "<p style='color: red;'>Błąd podczas dodawania: " . mysqli_error($conn) . "</p>";
        }
    }
    // Usuwanie zagrody
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'delete') {
        $idpola = mysqli_real_escape_string($conn, $_POST['idpola']);
        $deleteQuery = "DELETE FROM pola WHERE Idpola = '$idpola'";
        if (mysqli_query($conn, $deleteQuery)) {

        } else {
            echo "Błąd podczas usuwania zagrody: " . mysqli_error($conn);
        }
    }

    // Pobranie danych z tabeli "pola"
    $q = "SELECT * FROM pola";
    $result = mysqli_query($conn, $q);

    if (!$result) {
        die("Błąd zapytania: " . mysqli_error($conn));
    }

    // Wyświetlenie tabeli z danymi
    echo "<table>";
    echo "<thead>";
    echo "<tr>";
    echo "<th>Idpola</th>";
    echo "<th>Rozmiar_ha</th>";
    echo "<th>Rodzaj_gleby</th>";
    echo "</tr>";
    echo "</thead>";
    echo "<tbody>";

    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($row["Idpola"]) . "</td>";
        echo "<td>" . htmlspecialchars($row["Rozmiar_ha"]) . "</td>";
        echo "<td>" . htmlspecialchars($row["Rodzaj_gleby"]) . "</td>";
        echo "</tr>";
    }

    echo "</tbody>";
    echo "</table>";

    // Zamknięcie połączenia z bazą danych
    mysqli_close($conn);
    ?>
</body>

</html>