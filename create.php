<?php
include 'functions.php';
$pdo = pdo_connect_mysql();
$msg = '';

if (!empty($_POST)) {
    $id = isset($_POST['id']) && !empty($_POST['id']) && $_POST['id'] != 'auto' ? $_POST['id'] : NULL;
    $nama = isset($_POST['nama']) ? $_POST['nama'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $notelp = isset($_POST['notelp']) ? $_POST['notelp'] : '';
    $pekerjaan = isset($_FILES['pekerjaan']) ? $_FILES['pekerjaan'] : NULL;

    // Handle image upload and save to appropriate directory
    $uploadDir = 'upload/';
    $uploadedFileName = '';
    if ($pekerjaan) {
        $uploadedFileName = $uploadDir . basename($pekerjaan['name']);
        move_uploaded_file($pekerjaan['tmp_name'], $uploadedFileName);
    }

    $stmt = $pdo->prepare('INSERT INTO kontak VALUES (?, ?, ?, ?, ?)');
    $stmt->execute([$id, $nama, $email, $notelp, $uploadedFileName]);
    $msg = 'Created Successfully!';
}
?>

<?=template_header('Create')?>

<div class="content update">
    <h2>Create Contact</h2>
    <form action="create.php" method="post" enctype="multipart/form-data">
        <label for="id">ID</label>
        <label for="nama">Nama</label>
        <input type="text" name="id" value="auto" id="id">
        <input type="text" name="nama" id="nama">
        <label for="email">Jenis Item</label>
        <label for="notelp">Harga</label>
        <input type="text" name="email" id="email">
        <input type="text" name="notelp" id="notelp">
        <label for="pekerjaan">Upload Gambar</label>
        <input type="file" name="pekerjaan" id="pekerjaan">
        <input type="submit" value="Create">
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>
