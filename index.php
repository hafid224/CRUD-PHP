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
	<h1>Persediaan Barang</h1>
	<br>
	<br>
<table border="1" align="center">
	<tr style="text-align: center;font-weight: bold;background-color: #eee;">
		<td>ID</td>
		<td>Nama Barang</td>
		<td>Jenis Barang</td>
		<td>Harga Jual</td>
		<td>Jumlah</td>
		<td>Opsi</td>
	</tr>
	<?php
	include 'koneksi.php';
	$select = mysqli_query($koneksi, "SELECT * FROM barang");
	while ($hasil = mysqli_fetch_array($select)){
	?>
	<tr>
		<td><?php echo $hasil['id_brg'] ?></td>
		<td><?php echo $hasil['nama_brg'] ?></td>
		<td><?php echo $hasil['jenis_brg'] ?></td>
		<td><?php echo $hasil['harga_jual'] ?></td>
		<td><?php echo $hasil['jumlah'] ?></td>
		<td><a href="hapus.php?id_brg=<?php echo $hasil['id_brg'] ?>">Hapus |</a>
			<a href="edit.php?id_brg=<?php echo $hasil['id_brg'] ?>">Edit |</a>
			<a href="filestok.php?id_brg=<?php echo $hasil['id_brg'] ?>">Restok</a>
		</td>
	</tr>
<?php } ?>
</table>
<br>
	<a href="formtambah.php"><button >Tambah Data</button></a>
	<a href="formjual.php"><button >Jual Barang</button></a>
</body>
</html>