<html lang="zh-tw">
<head>
<meta charset="utf-8">
<title>g0v.today 工作回報列表</title>
</head>
<body>
<h3>g0v.today 工作回報列表</h3>
<ul>
<?php

$redis = new Redis();
$redis->connect('127.0.0.1');
$json = $redis->get('hubot:storage');
$arr = json_decode($json, true);
$tasks = @$arr['tasks'];
if (count($tasks) > 0) {
    foreach($tasks as $t) {
        $task_str = filter_var($t['task'], FILTER_SANITIZE_STRING);
        echo "<li>{$t['num']} - {$task_str}</li>\n";
    }
}
$redis->close();
?>
</ul>
</body>
</html>
