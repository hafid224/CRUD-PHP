<?php
include 'koneksi.php';
	$select = mysqli_query($koneksi, "SELECT * FROM barang");
	while ($hasil = mysqli_fetch_array($select)){
?>
<!DOCTYPE html>
<html>
<head>
	<title>Jual Barang</title>
<?php
include 'function.php';
?>
</head>
<body align="center">
	<h1>Form Jual Barang</h1>
	<br>
	<form action="" method="POST">
		<table align="center">
		<tr>
			<td><input type="hidden" name = "id_jual" ></td>
		</tr>
		<tr>
			<td>ID Pelanggan</td>
			<td><input type="text" name = "id_pelanggan" required></td>
		</tr>
		<tr>
			<td>ID Barang</td>
			<td><input type="text" name="id_brg" required></td>
		</tr>
		<tr>
			<td>Jumlah</td>
			<td><input type="text" name="jumlah" required></td>
		</tr>
		<tr>
			<td><input type="hidden" name="harga_jual"  value="<?php echo $hasil['harga_jual'] ?>"></td>
		</tr>
		<tr>
			<td><input type="hidden" name="total"></td>
		</tr>
		<tr>
			<td><input type="hidden" name="waktu" ></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="tombol" value="OK" ></td>
			<td></td>
			<td></td>
		</tr>
		</table>
</form>
<?php 
include 'koneksi.php';
if(isset($_POST['tombol'])){
	$insert = mysqli_query($koneksi, "INSERT INTO transksi VALUES('".$_POST['id_jual']."', '".$_POST['id_pelanggan']."', '".$_POST['id_brg']."', '".$_POST['jumlah']."', '".$_POST['harga_jual']."', '".$_POST['harga_jual']*$_POST['jumlah']."', now() )");
		if($insert){
		}else{
		
		}
	}
 ?>
<br><br>
 	<table border="1" width="50%" align="center">
	<tr style="text-align: center;font-weight: bold;background-color: #eee;">
		<td>ID Barang</td>
		<td>Nama Barang</td>
		<td>Harga Jual</td>
	</tr>
	<?php
	include 'koneksi.php';
	$select = mysqli_query($koneksi, "SELECT * FROM barang");
	while ($hasil = mysqli_fetch_array($select)){
	?>
	<tr>
		<td><?php echo $hasil['id_brg'] ?></td>
		<td><?php echo $hasil['nama_brg'] ?></td>
		<td><?php echo $hasil['harga_jual'] ?></td>
	</tr>
<?php } ?>
<?php } ?>
</table>
<tr></tr>
<br>
</body>
</html>