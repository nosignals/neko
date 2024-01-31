<?php

// MACHINE INFO
$devices=exec("cat /proc/cpuinfo | grep 'model name' | head -1 | cut -d: -f2");
// OS TYPE AND KERNEL VERSION
$kernelv=exec("cat /proc/sys/kernel/ostype").' '.exec("cat /proc/sys/kernel/osrelease");
$OSVer=exec("cat /proc/version_signature");

// MEMORY INFO
$tmpramTotal=exec("cat /proc/meminfo | grep MemTotal | awk '{print $2}'");
$tmpramAvailable=exec("cat /proc/meminfo | grep MemAvailable | awk '{print $2}'");

$ramTotal=number_format(($tmpramTotal/1000),1);
$ramAvailable=number_format(($tmpramAvailable/1000),1);
$ramUsage=number_format((($tmpramTotal-$tmpramAvailable)/1000),1);

// UPTIME
$raw_uptime=exec("cat /proc/uptime | awk '{print $1}'");
$hours = floor($raw_uptime / 3600);
$minutes = floor(($raw_uptime / 60) % 60);
$seconds = $raw_uptime % 60;

?>
