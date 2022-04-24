<?php 
include 'koneksi.php';
if (isset($_GET['id'])) {
	$delete = mysqli_query($koneksi, "DELETE FROM barang WHERE id_brg = '".$_GET['id']."' ");
	header('location:index.php');
}
?>