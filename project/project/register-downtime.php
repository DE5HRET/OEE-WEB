<?php
session_start();
include 'config.php';

// Check if user is logged in
//if (!isset($_SESSION['user_id'])) {
//    header("Location: login.php");
//    exit;
//}

// Get current date
$current_date = isset($_GET['date']) ? $_GET['date'] : date('Y-m-d');

// Fetch hourly data for the current date
function getHourlyData($pdo, $date) {
    $sql = "SELECT 
                h.hour,
                h.target,
                h.actual,
                h.backlog,
                p.project_name,
                e.employees_name,
                pl.line_name
            FROM HourlyOutput h
            JOIN Projects p ON h.project_id = p.project_id
            JOIN Employees e ON h.employees_id = e.employees_id
            JOIN ProductionLines pl ON h.line_id = pl.line_id
            WHERE h.date = ?
            ORDER BY h.hour";
    
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$date]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

$hourly_data = getHourlyData($pdo, $current_date);

// Process data for charts
$hours = [];
$actuals = [];
$targets = [];
$backlogs = [];

foreach ($hourly_data as $row) {
    $hour_label = sprintf("%02d:00-%02d:00", $row['hour'], $row['hour'] + 1);
    $hours[] = $hour_label;
    $actuals[] = $row['actual'];
    $targets[] = $row['target'];
    $backlogs[] = $row['backlog'];
}

// Convert to JSON for JavaScript
$chart_data = json_encode([
    'hours' => $hours,
    'actuals' => $actuals,
    'targets' => $targets,
    'backlogs' => $backlogs
]);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Production Dashboard - Benchmark Electronics</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        }

        body {
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

        .logout-btn {
            padding: 0.5rem 1.5rem;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 0.9rem;
        }

        .container {
            display: flex;
            min-height: calc(100vh - 64px);
        }

        .sidebar {
            width: 250px;
            background-color: white;
            padding: 2rem;
            border-right: 1px solid #eee;
        }

        .sidebar-menu {
            list-style: none;
        }

        .sidebar-menu li {
            margin-bottom: 1rem;
        }

        .sidebar-menu a {
            color: #333;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .main-content {
            flex: 1;
            padding: 2rem;
        }

        .chart-container {
            background: white;
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .chart-title {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 1rem;
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
        <form action="index.php" method="POST">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </nav>

    <div class="container">
        <aside class="sidebar">
            <ul class="sidebar-menu">
                <li><a href="input-data.php">📝 Input Data</a></li>
                <li><a href="view-data.php">👁️ View Data</a></li>
                <li><a href="dashboard.php">📊 Dashboard</a></li>
                <li><a href="manage-projects.php">📂 Manage Projects</a></li>
            </ul>
        </aside>

        <main class="main-content">
            <div class="chart-container">
                <h2 class="chart-title">Actual vs Target</h2>
                <canvas id="productionChart"></canvas>
            </div>

            <div class="chart-container">
                <h2 class="chart-title">Backlog Trend</h2>
                <canvas id="backlogChart"></canvas>
            </div>
        </main>
    </div>

    <script>
        // Parse the PHP data
        const chartData = <?php echo $chart_data; ?>;

        // Production Chart
        const productionCtx = document.getElementById('productionChart').getContext('2d');
        new Chart(productionCtx, {
            type: 'line',
            data: {
                labels: chartData.hours,
                datasets: [{
                    label: 'Actual',
                    data: chartData.actuals,
                    borderColor: 'rgb(66, 133, 244)',
                    fill: false,
                    tension: 0.4
                }, {
                    label: 'Target',
                    data: chartData.targets,
                    borderColor: 'rgb(251, 188, 4)',
                    borderDash: [5, 5],
                    fill: false
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Hourly Production Performance'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            drawBorder: false
                        }
                    }
                }
            }
        });

        // Backlog Chart
        const backlogCtx = document.getElementById('backlogChart').getContext('2d');
        new Chart(backlogCtx, {
            type: 'bar',
            data: {
                labels: chartData.hours,
                datasets: [{
                    label: 'Backlog',
                    data: chartData.backlogs,
                    backgroundColor: 'rgb(234, 67, 53)',
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Hourly Backlog Trend'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            drawBorder: false
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>