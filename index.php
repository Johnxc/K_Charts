<?php

require_once ('vendor/autoload.php');
require_once ('KChartHelper.php');

//use Monolog\Handler\StreamHandler;
//
//// create a log channel
//$log = new Monolog\Logger('name');
//$log->pushHandler(new StreamHandler('path/to/your.log', Logger::WARNING));


$startTime = microtime(true);
function getQuotes($stockCode){
    $databaseSetting = [
        // 必须配置项
        'database_type' => 'mysql',
        'database_name' => 'stockquotes',
        'server' => 'localhost',
        'username' => 'root',
        'password' => '',
        'charset' => 'utf8',

        // 可选参数
        'port' => 3306,

        // 连接参数扩展, 更多参考 http://www.php.net/manual/en/pdo.setattribute.php
        'option' => [
            PDO::ATTR_CASE => PDO::CASE_NATURAL
        ]
    ];

    $db = new medoo($databaseSetting);
    $fields = ['open','high','low','close','volume','tradingDate'];
    $where = ['stockCode' => $stockCode,'ORDER' => 'tradingDate'];
    $result = $db->select('stockDailyQuotes',$fields,$where);
    return $result;
}

header("Content-type:image/png");
$quoteArray = getQuotes('000001');
$chartHelper = new KChartHelper(array('bgColor'=>array(254,254,254)));
$chartHelper->datasource = $quoteArray;
$chartHelper->drawKChart();
$endTime = microtime(true);
