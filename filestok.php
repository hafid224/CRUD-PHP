<?php 
include 'koneksi.php';
$edit = mysqli_query($koneksi, "SELECT * FROM barang where id_brg = '".$_GET['id_brg']."' ");
$hasil = mysqli_fetch_array($edit);
 ?>
<!DOCTYPE html>
<html>
<head>
	<title>Edit Barang</title>
</head>
<body>
	<h2>isi form</h2>
	<a href="index.php">kembali</a>
	<form action="" method="POST">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name = "id_brg" readonly value="<?php echo $hasil['id_brg'] ?> "></td>
			</tr>
			<tr>
			<td>Nama Barang</td>
			<td><input type="text" name="nama_brg" readonly value="<?php echo $hasil['nama_brg'] ?>"></td>
		</tr>
			<tr>
				<td>Jenis Barang</td>
				<td><input type="text" name="jenis_brg" readonly value="<?php echo $hasil['jenis_brg'] ?>"></td>
			</tr>
		<tr>
			<td>Harga Beli</td>
			<td><input type="text" name="harga_beli" readonly value="<?php echo $hasil['harga_beli'] ?>"></td>
		</tr>
		<tr>
			<td>Harga Jual</td>
			<td><input type="text" name="harga_jual" readonly value="<?php echo $hasil['harga_jual'] ?>"></td>
		</tr>
		<tr>
			<td>Supplier</td>
			<td><input type="text" name="supplier" readonly value="<?php echo $hasil['supplier'] ?>"></td>
		</tr>
		<tr>
			<td>Jumlah Restok</td>
			<td><input type="text" name="jumlah"></td>
		</tr>
		<tr>
			<td><input type="hidden" name="jumlahmula" value="<?php echo $hasil['jumlah'] ?>"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="edit" value="OK" ></td>
		</tr>
		</table>
</form>
<?php 
if(isset($_POST['edit'])){
	$update = mysqli_query($koneksi, "UPDATE barang SET nama_brg = '".$_POST['nama_brg']."', jenis_brg = '".$_POST['jenis_brg']."', harga_beli = '".$_POST['harga_beli']."', harga_jual = '".$_POST['harga_jual']."', supplier = '".$_POST['supplier']."', jumlah = '".$_POST['jumlah']+$_POST['jumlahmula']."' WHERE id_brg = '".$_GET['id_brg']."' ");
	$insert = mysqli_query($koneksi, "INSERT INTO log_barang SET id_brg = '".$_POST['id_brg']."', keterangan = 'Restok', jumlah = '".$_POST['jumlah']."', waktu = now() ");
	if ($update) {
		header('location:index.php');
	} else{
		echo "gagal";
	}
	}
 ?>

</body>
</html>