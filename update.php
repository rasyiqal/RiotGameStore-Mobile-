<?php
include 'functions.php';
$pdo = pdo_connect_mysql();
$msg = '';

// Check if the contact id exists, for example update.php?id=1 will get the contact with the id of 1
if (isset($_GET['id'])) {
    if (!empty($_POST)) {
        // This part is similar to the create.php, but instead we update a record and not insert
        $id = isset($_POST['id']) ? $_POST['id'] : NULL;
        $nama = isset($_POST['nama']) ? $_POST['nama'] : '';
        $jenis = isset($_POST['jenis']) ? $_POST['jenis'] : '';
        $harga = isset($_POST['harga']) ? $_POST['harga'] : '';
        $gambar = $_FILES['gambar']['name'];

        // Specify the directory to save the uploaded files
        $uploadDir = 'C:/xampp/htdocs/phpcrud/upload/';
        $uploadedFileName = $uploadDir . basename($_FILES['gambar']['name']);
        move_uploaded_file($_FILES['gambar']['tmp_name'], $uploadedFileName);

        // Update the record
        $stmt = $pdo->prepare('UPDATE kontak SET id = ?, nama = ?, jenis = ?, harga = ?, gambar = ? WHERE id = ?');
        $stmt->execute([$id, $nama, $jenis, $harga, $gambar, $_GET['id']]);
        $msg = 'Updated Successfully!';
    }
    // Get the contact from the contacts table
    $stmt = $pdo->prepare('SELECT * FROM kontak WHERE id = ?');
    $stmt->execute([$_GET['id']]);
    $contact = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$contact) {
        exit('Contact doesn\'t exist with that ID!');
    }
} else {
    exit('No ID specified!');
}
?>

<?=template_header('Read')?>

<div class="content update">
	<h2>Update Contact #<?=$contact['id']?></h2>
    <form action="update.php?id=<?=$contact['id']?>" method="post" enctype="multipart/form-data">
        <label for="id">ID</label>
        <label for="nama">Nama</label>
        <input type="text" name="id" value="<?=$contact['id']?>" id="id">
        <input type="text" name="nama" value="<?=$contact['nama']?>" id="nama">
        <label for="jenis">jenis</label>
        <label for="harga">No. Telp</label>
        <input type="text" name="jenis" value="<?=$contact['jenis']?>" id="jenis">
        <input type="text" name="harga" value="<?=$contact['harga']?>" id="harga">
        <label for="gambar">gambar</label>
        <input type="file" name="gambar" id="gambar">
        <input type="submit" value="Update">
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>
