<?php
session_start();
require_once 'config.php'; // Database connection configuration

// Initialize error message variable
$error_message = '';

// Check if user is logged in
//if (!isset($_SESSION['user_id'])) {
 //   header("Location: login.php");
   // exit;
//}

// Fetch OEE data for each machine
$query = "
    SELECT 
        m.machine_name,
        SUM(pr.total_cycles) AS total_cycles,
        SUM(pr.good_units) AS good_units,
        SUM(pr.rejected_units) AS rejected_units,
        SUM(pd.actual_run_time) AS actual_run_time,
        SUM(pd.ideal_cycle_time * pr.total_cycles) AS ideal_run_time
    FROM Machines m
    JOIN Production_Record pr ON m.machine_id = pr.machine_id
    JOIN Performance_Data pd ON pr.record_id = pd.record_id
    GROUP BY m.machine_name
";
$machines = $pdo->query($query)->fetchAll(PDO::FETCH_ASSOC);

function calculateOEE($good_units, $total_cycles, $actual_run_time, $ideal_run_time) {
    if ($total_cycles == 0 || $actual_run_time == 0 || $ideal_run_time == 0) {
        return 0;
    }
    $availability = $actual_run_time / $ideal_run_time;
    $performance = $ideal_run_time / $actual_run_time;
    $quality = $good_units / $total_cycles;
    return $availability * $performance * $quality * 100;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Benchmark Electronics</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        }

        body {
            min-height: 100vh;
            background-color: #f5f5f5;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
            background-color: white;
            border-bottom: 1px solid #eee;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 2rem;
        }

        .nav-links a {
            color: #333;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .sign-in {
            padding: 0.5rem 1.5rem;
            background-color: white;
            color: #333;
            border: 1px solid #ddd;
            border-radius: 20px;
            cursor: pointer;
            font-size: 0.9rem;
        }

        .logout-btn {
            padding: 0.5rem 1.5rem;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 0.9rem;
        }

        .login-container {
            max-width: 400px;
            margin: 80px auto;
            padding: 2rem;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-size: 0.9rem;
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        .submit-btn {
            width: 100%;
            padding: 0.75rem;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #444;
        }

        .error-message {
            color: #dc3545;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }

        .footer {
            padding: 2rem;
            background-color: white;
            border-top: 1px solid #eee;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            margin: 0 auto;
        }

        .social-links a {
            margin-right: 1rem;
            color: #333;
            text-decoration: none;
        }

        .footer-links {
            display: flex;
            gap: 2rem;
        }

        .footer-section {
            margin-right: 2rem;
        }

        .footer-section h3 {
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
            color: #333;
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section ul li {
            margin-bottom: 0.5rem;
        }

        .footer-section ul li a {
            color: #666;
            text-decoration: none;
            font-size: 0.8rem;
        }

        .oee-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
        }

        .oee-circle {
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            color: #333;
        }
        
    </style>
</head>

<body>
    <nav class="navbar">
        <a href="index.php" class="logo">BM</a>
        <ul class="nav-links">
            <li><a href="index.php">Home</a></li>
            <li><a href="register-downtime.php">Register Downtime</a></li>
            <li><a href="work-tracking.php">Work Tracking</a></li>
            <li><a href="oee-all.php">OEE All</a></li>
        </ul>
        <form action="logout.php" method="POST">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </nav>

    <div class="container mt-5">
    <h1 class="text-center mb-4">OEE Dashboard</h1>
    <div class="row">
        <?php foreach ($machines as $machine): ?>
            <?php
            $oee = calculateOEE(
                $machine['good_units'],
                $machine['total_cycles'],
                $machine['actual_run_time'],
                $machine['ideal_run_time']
            );
            ?>
            <div class="col-md-4">
                <div class="oee-card">
                    <div class="oee-circle">
                        <?php echo round($oee, 2); ?>%
                    </div>
                    <h3><?php echo htmlspecialchars($machine['machine_name']); ?></h3>
                    <p>Performance details for <?php echo htmlspecialchars($machine['machine_name']); ?>.</p>
                </div>
            </div>
        <?php endforeach; ?>
    </div>

    <nav>
        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </nav>
</div>

</body>

</html>