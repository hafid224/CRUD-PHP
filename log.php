<?php
include 'function.php';
?>
<!DOCTYPE html>
<html>
<head>
	<title>Daftar Barang</title>
</head>
<body align="center">
	<br>
	<h1>Log barang</h1>
	<br>
	<br>
<table border="1" align="center">
	<tr style="text-align: center;font-weight: bold;background-color: #eee;">
		<td>ID Log</td>
		<td>ID Barang</td>
		<td>keterangan</td>
		<td>Jumlah</td>
		<td>Waktu</td>
	</tr>
	<?php
	include 'koneksi.php';
	$select = mysqli_query($koneksi, "SELECT * FROM log_barang");
	while ($hasil = mysqli_fetch_array($select)){
	?>
	<tr>
		<td><?php echo $hasil['id_log'] ?></td>
		<td><?php echo $hasil['id_brg'] ?></td>
		<td><?php echo $hasil['keterangan'] ?></td>
		<td><?php echo $hasil['jumlah'] ?></td>
		<td><?php echo $hasil['waktu'] ?></td>
	</tr>
<?php } ?>
</table>
<br>
	<a href="formtambah.php"><button >Tambah Data</button></a>
	<a href="formjual.php"><button >Jual Barang</button></a>
</body>
</html>