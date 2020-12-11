<?php
include 'functions.php';
// The output message
$msg = '';
// Check if user has uploaded new image
if (isset($_FILES['image'], $_POST['title'], $_POST['description'])) {
	// The folder where the images will be stored
	$target_dir = 'images/';
	// The path of the new uploaded image
	$image_path = $target_dir . basename($_FILES['image']['name']);
	// Check to make sure the image is valid
	if (!empty($_FILES['image']['tmp_name']) && getimagesize($_FILES['image']['tmp_name'])) {
		if (file_exists($image_path)) {
			$msg = 'La imagen ya está en la galería.';
		} else if ($_FILES['image']['size'] > 500000) {
			$msg = 'La imagen es demasiado pesada, escoge una de menos de 500kb.';
		} else {
			// Everything checks out now we can move the uploaded image
			move_uploaded_file($_FILES['image']['tmp_name'], $image_path);
			// Connect to MySQL
			$pdo = pdo_connect_mysql();
			// Insert image info into the database (title, description, image path, and date added)
			$stmt = $pdo->prepare('INSERT INTO images VALUES (NULL, ?, ?, ?, CURRENT_TIMESTAMP)');
	        $stmt->execute([$_POST['title'], $_POST['description'], $image_path]);
			$msg = 'Se ha subido tu imagen!';
		}
	} else {
		$msg = 'Por favor sube una imagen!';
	}
}
?>
<?=template_header('Upload Image')?>

<div class="content upload">
	<h2>Subir Imagen</h2>
	<form action="upload.php" method="post" enctype="multipart/form-data">
		<label for="image">Escoge la imagen</label>
		<input type="file" name="image" accept="image/*" id="image">
		<label for="title">Titulo</label>
		<input type="text" name="title" id="title">
		<label for="description">Descripcion</label>
		<textarea name="description" id="description"></textarea>
	    <input type="submit" value="Subir Imagen" name="submit">
	</form>
	<p><?=$msg?></p>
</div>

<?=template_footer()?>
