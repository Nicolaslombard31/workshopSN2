<?php
// Connexion MySQL
$host = "localhost";
$dbname = "immo_maison";
$username = "root"; // utilisateur Laragon
$password = ""; // mot de passe Laragon par défaut vide

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connexion échouée: " . $conn->connect_error);
}

// Récupération des données POST
$name = $_POST['name'];
$email = $_POST['email'];
$message = $_POST['message'];

// Préparer et exécuter la requête d'insertion
$stmt = $conn->prepare("INSERT INTO contact (name, email, message) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $name, $email, $message);

if ($stmt->execute()) {
    echo "Merci pour votre message !";
} else {
    echo "Erreur: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
