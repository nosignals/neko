<?php
include '../cfg.php';
$neko_log_path="$neko_dir/tmp/log.txt";
$neko_bin_log_path="$neko_dir/tmp/neko_log.txt";

if(isset($_GET['data'])){
    $dt = $_GET['data'];
    if ($dt == 'neko') echo shell_exec("cat $neko_log_path");
    else if($dt == 'bin') echo shell_exec("cat $neko_bin_log_path");
}
?>
