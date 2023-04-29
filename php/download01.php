<?php
$filename = "https://www.siyaluma.lk/storage/Application.pdf";

header("Content-Length: " . filesize($filename));
//header('Content-Type: application/octet-stream');
header("Pragma: no-cache"); 
header("Content-type: application/file");
header('Content-Disposition: attachment; filename=Application.pdf');

readfile($filename);
?>