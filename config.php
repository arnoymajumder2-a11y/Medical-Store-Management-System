
<?php
declare(strict_types=1);

session_start();

// Database configuration
$dbHost = getenv('DB_HOST') ?: 'localhost';
$dbName = getenv('DB_NAME') ?: 'medical_store_db';
$dbUser = getenv('DB_USER') ?: 'root';
$dbPass = getenv('DB_PASS') ?: '';

try {
    $pdo = new PDO(
        "mysql:host=$dbHost;dbname=$dbName;charset=utf8mb4",
        $dbUser,
        $dbPass,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );
} catch (PDOException $e) {
    error_log($e->getMessage());
    http_response_code(500);
    die('Database connection failed. Check database configuration.');
}

// HTML escaping
function h($v): string {
    return htmlspecialchars((string)$v, ENT_QUOTES, 'UTF-8');
}

// Redirect
function go($p = 'dashboard.php') {
    header("Location: $p");
    exit;
}

// Authentication
function require_login() {
    if (empty($_SESSION['admin_id'])) {
        go('login.php');
    }
}

// Flash messages
function flash($m, $type = 'ok') {
    $_SESSION['flash'] = ['m' => $m, 't' => $type];
}

function show_flash() {
    if (!empty($_SESSION['flash'])) {
        $f = $_SESSION['flash'];
        echo '<div class="alert ' .
            ($f['t'] === 'error' ? 'error' : '') .
            '">' . h($f['m']) . '</div>';
        unset($_SESSION['flash']);
    }
}

// CSRF protection
function csrf() {
    if (empty($_SESSION['csrf'])) {
        $_SESSION['csrf'] = bin2hex(random_bytes(24));
    }
    return $_SESSION['csrf'];
}

function check_csrf() {
    if (!hash_equals($_SESSION['csrf'] ?? '', $_POST['csrf'] ?? '')) {
        http_response_code(403);
        exit('Invalid request token.');
    }
}
