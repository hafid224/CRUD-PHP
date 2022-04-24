<?php
include 'function.php';
?>
<!DOCTYPE html>
<html>
<head>
	<title>Tambah Barang</title>
</head>
<body align="center" bgcolor="f0efeb">
	<br>
	<h2>Form Tambah Barang</h2>
	<form action="" method="POST" >
		<table align="center">
		<tr>
			<td><input type="hidden" name = "id_transaksi" ></td>
		</tr>
		<tr>
			<td><input type="hidden" name="keterangan" value="Barang masuk"></td>
		</tr>
		<tr>
			<td>ID Barang</td>
			<td><input type="text" name = "id_brg" required></td>
		</tr>
		<tr>
			<td>Nama Barang</td>
			<td><input type="text" name="nama_brg" required></td>
		</tr>
		<tr>
			<td>Jenis Barang</td>
			<td><input type="text" name="jenisbarang" required></td>
		</tr>
		<tr>
			<td>Harga beli</td>
			<td><input type="text" name="harga_beli" required></td>
		</tr>
		<tr>
			<td>Harga Jual</td>
			<td><input type="text" name="harga_jual" required></td>
		</tr>
		<tr>
			<td>Supplier</td>
			<td><input type="text" name="supplier" required></td>
		</tr>
		<tr>
			<td>Jumlah Barang</td>
			<td><input type="text" name="jumlah" required></td>
		</tr>
		<tr>
			<td><input type="hidden" name="waktu" ></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="tombol" value="Tambah" ></td>
		</tr>
		</table>
</form>

<?php 
include 'koneksi.php';
if(isset($_POST['tombol'])){
	$insert = mysqli_query($koneksi, "INSERT INTO suplai VALUES('".$_POST['id_transaksi']."','".$_POST['keterangan']."', '".$_POST['id_brg']."', '".$_POST['nama_brg']."', '".$_POST['jenisbarang']."','".$_POST['harga_beli']."', '".$_POST['harga_jual']."', '".$_POST['supplier']."', '".$_POST['jumlah']."', now() )");
		if($insert){
		}else{
		
		}
	}
 ?>

</body>
</html>