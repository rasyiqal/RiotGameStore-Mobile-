<?php
include 'functions.php';
$pdo = pdo_connect_mysql();
$msg = '';

if (!empty($_POST)) {
    $id = isset($_POST['id']) && !empty($_POST['id']) && $_POST['id'] != 'auto' ? $_POST['id'] : NULL;
    $nama = isset($_POST['nama']) ? $_POST['nama'] : '';
    $jenis = isset($_POST['jenis']) ? $_POST['jenis'] : '';
    $harga = isset($_POST['harga']) ? $_POST['harga'] : '';
    $gambar = isset($_FILES['gambar']) ? $_FILES['gambar'] : NULL;

    // Handle image upload and save to appropriate directory
    $uploadDir = 'upload/';
    $uploadedFileName = '';
    if ($gambar) {
        $uploadedFileName = $uploadDir . basename($gambar['name']);
        move_uploaded_file($gambar['tmp_name'], $uploadedFileName);
    }

    $stmt = $pdo->prepare('INSERT INTO data VALUES (?, ?, ?, ?, ?)');
    $stmt->execute([$id, $nama, $jenis, $harga, $uploadedFileName]);
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
        <label for="jenis">Jenis Item</label>
        <label for="harga">Harga</label>
        <input type="text" name="jenis" id="jenis">
        <input type="text" name="harga" id="harga">
        <label for="gambar">Upload Gambar</label>
        <input type="file" name="gambar" id="gambar">
        <input type="submit" value="Create">
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>
