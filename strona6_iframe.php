<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Szczegoly-upraw</title>
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
            margin-left: 548px;
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
        $idrolnika = mysqli_real_escape_string($conn, $_POST['Idrolnika']);
        $idmaszyny = mysqli_real_escape_string($conn, $_POST['Idmaszyny']);
        $Czynnosc = mysqli_real_escape_string($conn, $_POST['Czynnosc']);
        $Data = mysqli_real_escape_string($conn, $_POST['Data']);

        // Zapytanie SQL do dodania rekordu (bez podawania Iduprawy)
        $insertQuery = "INSERT INTO szczegolyupraw (`IdRolnika`, `IdMaszyny`, `Czynnosc`, `DataWykonaniaCzynosci`) VALUES ('$idrolnika', '$idmaszyny', '$Czynnosc', '$Data')";
        if (mysqli_query($conn, $insertQuery)) {
            header("Location: strona6_iframe.php"); // Przekierowanie po dodaniu rekordu
            exit();
        } else {
            echo "<p style='color: red;'>Błąd podczas dodawania: " . mysqli_error($conn) . "</p>";
        }
    }

    // Pobranie danych z tabeli "szczegolyupraw"
    $q = "SELECT * FROM szczegolyupraw";
    $result = mysqli_query($conn, $q);

    if (!$result) {
        die("Błąd zapytania: " . mysqli_error($conn));
    }

    // Wyświetlenie tabeli z danymi
    echo "<table>";
    echo "<thead>";
    echo "<tr>";
    echo "<th>Iduprawy</th>";
    echo "<th>IdRolnika</th>";
    echo "<th>IdMaszyny</th>";
    echo "<th>Czynnosc</th>";
    echo "<th>Data</th>";
    echo "</tr>";
    echo "</thead>";
    echo "<tbody>";

    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($row["Iduprawy"]) . "</td>";
        echo "<td>" . htmlspecialchars($row["IdRolnika"]) . "</td>";
        echo "<td>" . htmlspecialchars($row["IdMaszyny"]) . "</td>";
        echo "<td>" . htmlspecialchars($row["Czynnosc"]) . "</td>";
        echo "<td>" . htmlspecialchars($row["DataWykonaniaCzynosci"]) . "</td>";
        echo "</tr>";
    }

    echo "</tbody>";
    echo "</table>";

    // Zamknięcie połączenia z bazą danych
    mysqli_close($conn);
    ?>
</body>

</html>