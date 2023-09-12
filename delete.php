<?php
include 'functions.php';
$pdo = pdo_connect_mysql();
$msg = '';

// Check if the contact ID exists
if (isset($_GET['id'])) {
    // Select the record that is going to be deleted
    $stmt = $pdo->prepare('SELECT * FROM kontak WHERE id = ?');
    $stmt->execute([$_GET['id']]);
    $contact = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$contact) {
        exit('Contact doesn\'t exist with that ID!');
    }
    
    // User clicked the "Yes" button, delete record
    if (isset($_GET['confirm']) && $_GET['confirm'] == 'yes') {
        // First, check if there's a pekerjaan (gambar) associated with the contact
        if ($contact['pekerjaan'] !== '' && file_exists($contact['pekerjaan'])) {
            // Delete the image file from the directory
            unlink($contact['pekerjaan']);
        }
        
        // Delete the record from the database
        $stmt = $pdo->prepare('DELETE FROM kontak WHERE id = ?');
        $stmt->execute([$_GET['id']]);
        $msg = 'You have deleted the contact!';
    } elseif (isset($_GET['confirm']) && $_GET['confirm'] == 'no') {
        // User clicked the "No" button, redirect them back to the read page
        header('Location: read.php');
        exit;
    }
} else {
    exit('No ID specified!');
}
?>

<?=template_header('Delete')?>

<div class="content delete">
    <h2>Delete Contact #<?=$contact['id']?></h2>
    <?php if ($msg): ?>
        <p><?=$msg?></p>
    <?php else: ?>
        <p>Are you sure you want to delete contact #<?=$contact['id']?>?</p>
        <div class="yesno">
            <a href="delete.php?id=<?=$contact['id']?>&confirm=yes">Yes</a>
            <a href="delete.php?id=<?=$contact['id']?>&confirm=no">No</a>
        </div>
    <?php endif; ?>
</div>

<?=template_footer()?>
