<?php
session_start();
require_once 'config.php'; 

if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}

$sql = "SELECT 
            date, 
            SUM(target) AS total_target, 
            SUM(actual) AS total_actual, 
            SUM(backlog) AS total_backlog 
        FROM HourlyOutput 
        GROUP BY date";
$result = $conn->query($sql);

if (!$result) {
    die("Query failed: " . $conn->error);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Hourly Output Dashboard</h1>
    <table class="table table-bordered mt-4">
        <thead>
        <tr>
            <th>Date</th>
            <th>Total Target</th>
            <th>Total Actual</th>
            <th>Total Backlog</th>
        </tr>
        </thead>
        <tbody>
        <?php while ($row = $result->fetch_assoc()) : ?>
            <tr>
                <td><?= $row['date']; ?></td>
                <td><?= $row['total_target']; ?></td>
                <td><?= $row['total_actual']; ?></td>
                <td><?= $row['total_backlog']; ?></td>
            </tr>
        <?php endwhile; ?>
        </tbody>
    </table>
</div>
</body>
</html>

<?php
$conn->close();
?>
