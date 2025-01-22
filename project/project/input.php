<?php
session_start();
require_once 'config.php';

// Check if user is logged in
//if (!isset($_SESSION['user_id'])) {
//   header("Location: login.php");
//    exit;
//}

// Fetch all projects, employees, and production lines for dropdowns
$projects = $pdo->query("SELECT * FROM Projects")->fetchAll();
$employees = $pdo->query("SELECT * FROM Employees")->fetchAll();
$production_lines = $pdo->query("SELECT * FROM ProductionLines")->fetchAll();

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $stmt = $pdo->prepare("INSERT INTO HourlyOutput 
            (project_id, employees_id, line_id, date, shift, hour, target, actual, backlog, trouble, corrective_action)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

        $stmt->execute([
            $_POST['project_id'],
            $_POST['employees_id'],
            $_POST['line_id'],
            $_POST['date'],
            $_POST['shift'],
            $_POST['hour'],
            $_POST['target'],
            $_POST['actual'],
            $_POST['backlog'],
            $_POST['trouble'],
            $_POST['corrective_action']
        ]);

        $success_message = "Data successfully recorded!";
    } catch (PDOException $e) {
        $error_message = "Error recording data: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Input Data - Benchmark Electronics</title>
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

        /* [Previous CSS styles from dashboard remain the same] */

        .form-container {
            background: white;
            border-radius: 8px;
            padding: 2rem;
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

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        .submit-btn {
            padding: 0.75rem 1.5rem;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
        }

        .success-message {
            color: #28a745;
            padding: 1rem;
            margin-bottom: 1rem;
            background-color: #d4edda;
            border-radius: 4px;
        }

        .error-message {
            color: #dc3545;
            padding: 1rem;
            margin-bottom: 1rem;
            background-color: #f8d7da;
            border-radius: 4px;
        }
    </style>
</head>

<body>
    <!-- [Previous navbar code remains the same] -->
    <nav class="navbar">
        <a href="index.php" class="logo">BM</a>
        <ul class="nav-links">
            <li><a href="index.php">Home</a></li>
            <li><a href="register-downtime.php">Register Downtime</a></li>
            <li><a href="work-tracking.php">Work Tracking</a></li>
            <li><a href="oee-all.php">OEE All</a></li>
        </ul>
        <button class="sign-in">Sign in</button>
    </nav>

    <div class="container">
        <!-- [Previous sidebar code remains the same] -->

        <main class="main-content">
            <div class="form-container">
                <h2>Input Production Data</h2>

                <?php if (isset($success_message)): ?>
                    <div class="success-message"><?php echo $success_message; ?></div>
                <?php endif; ?>

                <?php if (isset($error_message)): ?>
                    <div class="error-message"><?php echo $error_message; ?></div>
                <?php endif; ?>

                <form method="POST">
                    <div class="form-group">
                        <label for="project_id">Project</label>
                        <select name="project_id" required>
                            <?php foreach ($projects as $project): ?>
                                <option value="<?php echo $project['project_id']; ?>">
                                    <?php echo htmlspecialchars($project['project_name']); ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="employees_id">Employee</label>
                        <select name="employees_id" required>
                            <?php foreach ($employees as $employee): ?>
                                <option value="<?php echo $employee['employees_id']; ?>">
                                    <?php echo htmlspecialchars($employee['employees_name']); ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="line_id">Production Line</label>
                        <select name="line_id" required>
                            <?php foreach ($production_lines as $line): ?>
                                <option value="<?php echo $line['line_id']; ?>">
                                    <?php echo htmlspecialchars($line['line_name']); ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="date">Date</label>
                        <input type="date" name="date" required value="<?php echo date('Y-m-d'); ?>">
                    </div>

                    <div class="form-group">
                        <label for="shift">Shift</label>
                        <select name="shift" required>
                            <option value="Morning">Morning</option>
                            <option value="Afternoon">Afternoon</option>
                            <option value="Night">Night</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="hour">Hour</label>
                        <select name="hour" required>
                            <?php for ($i = 0; $i < 24; $i++): ?>
                                <option value="<?php echo $i; ?>">
                                    <?php echo sprintf("%02d:00", $i); ?>
                                </option>
                            <?php endfor; ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="target">Target</label>
                        <input type="number" name="target" required min="0">
                    </div>

                    <div class="form-group">
                        <label for="actual">Actual</label>
                        <input type="number" name="actual" required min="0">
                    </div>

                    <div class="form-group">
                        <label for="backlog">Backlog</label>
                        <input type="number" name="backlog" required min="0">
                    </div>

                    <div class="form-group">
                        <label for="trouble">Trouble/Issues</label>
                        <textarea name="trouble" rows="3"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="corrective_action">Corrective Action</label>
                        <textarea name="corrective_action" rows="3"></textarea>
                    </div>

                    <button type="submit" class="submit-btn">Submit Data</button>
                </form>
            </div>
        </main>
    </div>
</body>

</html>