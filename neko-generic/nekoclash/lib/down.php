<?php
$hname=exec("logname");
$neko_dir="/home/$hname/.neko";
$stat = exec("cat $neko_dir/tmp/neko.status");
if($stat==1) $tmp = shell_exec("cat /sys/class/net/Meta/statistics/rx_bytes");
else $tmp = "0";
$data = "";
if ($tmp < 1024000) $data = number_format(($tmp/1024),1)." KB";
elseif ($tmp > 1024000 && $tmp < 1024000000) $data = number_format(($tmp/1024000),1)." MB";
elseif ($tmp > 1024000000) $data = number_format(($tmp/1024000000),2)." GB";
echo $data;
?>
