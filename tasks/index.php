<html lang="zh-tw">
<head>
<meta charset="utf-8">
<title>g0v.today 工作回報列表</title>
<style>
body {
    margin-top: 70px;
    color: #333;
}

pre {
    background-color: rgba(5%, 80%, 5%, 0.1);
    border: 1px solid #AAA;
    padding: 5px;
}

h2, h3 {
    border-bottom: 1px solid #AAA;
    margin-top: 30px;
}
</style>
</head>
<body>
<h2>g0v.today 工作回報列表</h2>
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

<p>
<h3>回報方法</h3>
<pre>
在 freenode #g0v.tw IRC channel 中，輸入：
b0t-issue: task add 事情 # 增加一個 task

輸入以下這段文字，即可看到相關說明：
b0t-issue: help
</pre>
</p>
</body>
</html>
