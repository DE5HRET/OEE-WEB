<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benchmark Electronics</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
            background-color: white;
            position: absolute;
            width: 100%;
            z-index: 10;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
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

        /* Hero Section */
        .hero {
            height: 100vh;
            position: relative;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
                url('pic/home_page/bk_benchmark_3.jpg') no-repeat center center;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        .hero-content {
            max-width: 800px;
            padding: 0 2rem;
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
            font-weight: bold;
        }

        .hero p {
            font-size: 1.2rem;
            line-height: 1.6;
            opacity: 0.9;
        }

        /* Footer */
        .footer {
            padding: 3rem 10%;
            background-color: white;
            color: #333;
        }

        .social-links {
            margin-bottom: 3rem;
        }

        .social-links a {
            margin-right: 1.5rem;
            color: #333;
            text-decoration: none;
            font-size: 1.2rem;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2rem;
        }

        .footer-section h3 {
            font-size: 1rem;
            margin-bottom: 1.5rem;
            color: #333;
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section ul li {
            margin-bottom: 0.8rem;
        }

        .footer-section ul li a {
            color: #666;
            text-decoration: none;
            font-size: 0.9rem;
        }
    </style>
</head>

<body>
    <nav class="navbar">
        <div class="logo">BM</div>
        <ul class="nav-links">
            <li><a href="index.php">Home</a></li>
            <li><a href="register-downtime.php">Register Downtime</a></li>
            <li><a href="work-tracking.php">Work Tracking</a></li>
            <li><a href="oee-all.php">OEE All</a></li>
        </ul>
        <?php if (isset($_SESSION['user_id'])): ?>
            <form action="logout.php" method="POST">
                <button type="submit" class="sign-in">Sign out</button>
            </form>
        <?php else: ?>
            <a href="login.php"><button class="sign-in">Sign in</button></a>
        <?php endif; ?>
    </nav>

    <header class="hero">
        <div class="hero-content">
            <h1>Benchmark Electronics</h1>
            <p>Ready to learn more about the full range of advanced capabilities available at Benchmark's global locations? Let's start the conversation!</p>
        </div>
    </header>

    <footer class="footer">
        <div class="social-links">
            <a href="https://www.bench.com/ayutthaya-thailand" aria-label="Web Page">𝕏</a>
            <a href="#" aria-label="Instagram">○</a>
            <a href="#" aria-label="YouTube">◉</a>
            <a href="#" aria-label="LinkedIn">in</a>
        </div>
        <div class="footer-grid">
            <div class="footer-section">
                <h3>Use cases</h3>
                <ul>
                    <li><a href="#">UI design</a></li>
                    <li><a href="#">UX design</a></li>
                    <li><a href="#">Wireframing</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Explore</h3>
                <ul>
                    <li><a href="#">Design</a></li>
                    <li><a href="#">Prototyping</a></li>
                    <li><a href="#">Development features</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Resources</h3>
                <ul>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">Best practices</a></li>
                    <li><a href="#">Colors</a></li>
                </ul>
            </div>
        </div>
    </footer>
</body>

</html>