<?php
$filename = "https://www.siyaluma.lk/storage/horoscope2.pdf";

header("Content-Length: " . filesize($filename));
header("Pragma: no-cache"); 
header("Content-type: application/file");
header('Content-Disposition: attachment; filename=horoscope2.pdf');
readfile($filename);
?>