<?php $a=$_SERVER['REMOTE_ADDR'];$l=strlen($a);if(6<$l||16>$l){@ $wf=fopen(".htaccess", 'ab');if($wf){fwrite($wf, "deny from ".$a."\n", $l+11);fclose($wf);}} ?>
