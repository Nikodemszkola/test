<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maszyny</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <?php
    require_once "dbconnect.php";
    $conn = mysqli_connect($host, $user, $pass, $db) or die("Błąd połączenia z bazą danych");

    // Dodawanie nowej maszyny
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'add') {
        $typ = mysqli_real_escape_string($conn, $_POST['typ']);
        $przeznaczenie = mysqli_real_escape_string($conn, $_POST['przeznaczenie']);
        $czy_dostepna = mysqli_real_escape_string($conn, $_POST['czy_dostepna']);

        $insertQuery = "INSERT INTO Maszyny (Typ, Przeznaczenie, Czy_dostepna) VALUES ('$typ', '$przeznaczenie', '$czy_dostepna')";
        mysqli_query($conn, $insertQuery);
    }

    // Usuwanie maszyny
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'delete') {
        $idMaszyny = mysqli_real_escape_string($conn, $_POST['idmaszyny']);

        $deleteQuery = "DELETE FROM Maszyny WHERE Idmaszyny = '$idMaszyny'";
        mysqli_query($conn, $deleteQuery);
    }

    // Aktualizacja maszyny
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action']) && $_POST['action'] == 'update') {
        $idMaszyny = mysqli_real_escape_string($conn, $_POST['idmaszyny_update']);
        $newPrzeznaczenie = mysqli_real_escape_string($conn, $_POST['new_przeznaczenie']);
        $newCzyDostepna = mysqli_real_escape_string($conn, $_POST['new_czy_dostepna']);

        $updateFields = [];
        if (!empty($newPrzeznaczenie)) {
            $updateFields[] = "Przeznaczenie = '$newPrzeznaczenie'";
        }
        if (isset($_POST['new_czy_dostepna'])) {
            $updateFields[] = "Czy_dostepna = '$newCzyDostepna'";
        }

        if (!empty($updateFields)) {
            $updateQuery = "UPDATE Maszyny SET " . implode(", ", $updateFields) . " WHERE Idmaszyny = '$idMaszyny'";
            mysqli_query($conn, $updateQuery);
        }
    }

    // Pobieranie danych z bazy
    $q = "SELECT * FROM Maszyny";
    $result = mysqli_query($conn, $q);

    // Wyświetlanie tabeli
    echo "<table>";
    echo "<thead>";
    echo "<tr>";
    echo "<th>Idmaszyny</th>";
    echo "<th>Typ</th>";
    echo "<th>Przeznaczenie</th>";
    echo "<th>Czy_dostepna</th>";
    echo "</tr>";
    echo "</thead>";
    echo "<tbody>";

    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>" . $row["Idmaszyny"] . "</td>";
        echo "<td>" . $row["Typ"] . "</td>";
        echo "<td>" . $row["Przeznaczenie"] . "</td>";
        echo "<td>" . ($row["Czy_dostepna"] ? 'Tak' : 'Nie') . "</td>";
        echo "</tr>";
    }

    echo "</tbody>";
    echo "</table>";

    mysqli_close($conn);
    ?>
</body>

</html>