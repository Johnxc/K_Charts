<?php

class KChartHelper{

    public $datasource = null;
    protected $imHandle = null;
    protected $headerHeight = null; //头部区域高度
    protected $bodyHeight = null; //主体区域高度
    protected $daysRegionHeight = null; //时间区域高度
    protected $volumeImgHeight = null; //成交量区域高度
    protected $borderWidth = 2; //图片边框宽度
    protected $bodyWidth = null; //K线图宽度


    protected $config = array(
        'imgWidth' => 1000,
        'imgHeight' => 400,
        'upColor' => array(255,0,0),
        'downColor' => array(204,182,182),
        'bgColor' => array(74,74,74),
        'open' => 'open',
        'high' => 'high',
        'low' => 'low',
        'close' => 'close',
        'volume' => 'volume',
        'tradingDate' => 'tradingDate',
        'leftSpace' => 20,
        'rightSpace' => 20,
        'topSpace' => 20,
        'bottomSpace' => 20,
        'margin' => 8,
        'volumeImgHeight' => 0,
        'borderWidth' => 2
    );

    public function __construct($config){
        $this->config = array_merge($this->config,$config);
    }

    public function __get($name){
        return $this->config[$name];
    }

    public function __set($name, $value)
    {
        if(isset($this->config[$name])){
            $this->config[$name] = $value;
        }
    }

    public function drawKChart(){
        if(!$this->datasource){
            throw new Exception('draw k chart needs datasource,but it looks is null');
        }

        $dayCount = count($this->datasource);

        $sourceImgHeight = $this->imgHeight;

        $rightNumWidth = 46;


        //创建画布
        $this->imHandle = imagecreate($this->imgWidth,$this->imgHeight);

        $this->imgWidth = $this->imgWidth - $rightNumWidth;
        //填充背景
        imagecolorallocate($this->imHandle,$this->bgColor[0],$this->bgColor[1],$this->bgColor[2]);

        //画边框
        imagesetthickness($this->imHandle,$this->borderWidth);
        $borderColor = imagecolorallocate($this->imHandle,148,148,148);

        imageline($this->imHandle,0,0,$this->imgWidth - $this->borderWidth,0,$borderColor); //横
        imageline($this->imHandle,0,0,0,$this->imgHeight,$borderColor);
        imageline($this->imHandle,$this->imgWidth - $this->borderWidth,0,$this->imgWidth - $this->borderWidth,$this->imgHeight - $this->borderWidth,$borderColor);
        imageline($this->imHandle,0,$this->imgHeight - $this->borderWidth,$this->imgWidth - $this->borderWidth,$this->imgHeight - $this->borderWidth,$borderColor);

        //头部
        $this->headerHeight = 40;

        $this->volumeImgHeight = ($this->imgHeight - $this->headerHeight - $this->borderWidth * 2 - 1) / 4;

        imagesetthickness($this->imHandle,1);


        $this->bodyWidth = $this->imgWidth - $this->leftSpace - $this->rightSpace - ($this->margin * ($dayCount - 1));
        $this->bodyHeight = $this->imgHeight - $this->topSpace - $this->bottomSpace - $this->volumeImgHeight - $this->headerHeight;

        $dayWidth = $this->bodyWidth / $dayCount; //每天K线宽度
        $highestArray = $this->datasource;
        $lowestArray = $this->datasource;
        $volumeArray = $this->datasource;
        $tradingDayArray = $this->datasource;

        usort($highestArray,function($a,$b){
            if($a[$this->high] == $b[$this->high]){
                return 0;
            }
            return $a[$this->high] > $b[$this->high] ? -1 : 1;
        });
        usort($volumeArray,function($a,$b){
            if($a[$this->volume] == $b[$this->volume]){
                return 0;
            }
            return $a[$this->volume] > $b[$this->volume] ? -1 : 1;
        });
        usort($lowestArray,function($a,$b){
            if($a[$this->low] == $b[$this->low]){
                return 0;
            }
            return $a[$this->low] > $b[$this->low] ? 1 : -1;
        });
        usort($tradingDayArray,function($a,$b){
            if($a[$this->tradingDate] == $b[$this->tradingDate]){
                return 0;
            }
            return $a[$this->tradingDate] > $b[$this->tradingDate] ? -1 : 1;
        });

        $highest = $highestArray[0][$this->high];
        $lowest = $lowestArray[0][$this->low];
        $unitPxPrice = $this->bodyHeight / ($highest - $lowest);
        $unitPricePx = ($highest - $lowest) / $this->bodyHeight;

        $volumeHighest = $volumeArray[0][$this->volume];
        $unitPxVolume = $this->volumeImgHeight / $volumeHighest;

        $startTradingDay = date('Y-m-d',$tradingDayArray[0][$this->tradingDate]);
        $endTradingDay = date('Y-m-d',end($tradingDayArray)[$this->tradingDate]);

        //时间区间
        $this->daysRegionHeight = 25;
        $daysRegionYStart = $this->imgHeight - $this->volumeImgHeight - $this->daysRegionHeight;
        imageline($this->imHandle,0,$daysRegionYStart,$this->imgWidth-$this->borderWidth,$daysRegionYStart,$borderColor);
        imagestring($this->imHandle,2,$this->borderWidth,$daysRegionYStart+2,$startTradingDay,$borderColor);
        imagestring($this->imHandle,2,$this->imgWidth-$this->borderWidth-60,$daysRegionYStart+2,$endTradingDay,$borderColor);

        $volumeLineColor = imagecolorallocate($this->imHandle,186,194,191);
        //下面一条
        imageline($this->imHandle,0,$this->imgHeight - $this->volumeImgHeight,$this->imgWidth - $this->borderWidth,$this->imgHeight - $this->volumeImgHeight,$volumeLineColor);

        $xStep = $this->leftSpace;

        $forStep = $this->bodyHeight / 4;
        $splitLineColor = imagecolorallocate($this->imHandle,210,210,210);
        for($i = $forStep;$i < $this->bodyHeight;$i+=$forStep){
            $splitLineHeight = $i + $this->headerHeight;
            imageline($this->imHandle,0,$splitLineHeight,$this->imgWidth,$splitLineHeight,$splitLineColor);
            imagestring($this->imHandle,2,$this->imgWidth+1,$splitLineHeight,$i*$unitPricePx,$splitLineColor);
        }

        foreach ($this->datasource AS $key => $item){
            $xStep = $this->leftSpace + ($key * ($dayWidth)) + ($key * $this->margin);
            $lineColorArray = $item[$this->open] > $item[$this->close] ? $this->downColor: $this->upColor;
            $lineColor = imagecolorallocate($this->imHandle,$lineColorArray[0],$lineColorArray[1],$lineColorArray[2]);

            $topLinePrice = $item[$this->open] > $item[$this->close] ? $item[$this->open] : $item[$this->close];
            $bottomLinePrice = $item[$this->open] < $item[$this->close] ? $item[$this->open] : $item[$this->close];

            //上竖线：最高价
            $topLineYStart = ($highest - $item[$this->high]) * $unitPxPrice + $this->topSpace;
            $topLineYEnd = (($item[$this->high] - $topLinePrice) * $unitPxPrice) + $topLineYStart;
            $verticalLineX = $xStep + ($dayWidth / 2);
            imageline($this->imHandle,$verticalLineX,$topLineYStart,$verticalLineX,$topLineYEnd,$lineColor);

            //中间：矩形填充
            $middleRectHeight = ($topLinePrice - $bottomLinePrice) * $unitPxPrice;
            $middleTopX = $xStep;
            $middleTopY = $topLineYEnd;
            $middleBottomX = $xStep + $dayWidth;
            $middleBottomY = $middleTopY + $middleRectHeight;
            imagefilledrectangle($this->imHandle,$middleTopX,$middleTopY,$middleBottomX,$middleBottomY,$lineColor);

            //下竖线：最低价
            $bottomLineHeight = ( $bottomLinePrice - $item[$this->low] ) * $unitPxPrice;
            imageline($this->imHandle,$verticalLineX,$middleBottomY,$verticalLineX,$bottomLineHeight+$middleBottomY,$lineColor);

            //成交量
            $volumeHeight = $sourceImgHeight - $unitPxVolume * $item[$this->volume];
            imagefilledrectangle($this->imHandle,$middleTopX,$volumeHeight,$middleBottomX,$sourceImgHeight - $this->borderWidth,$lineColor);
        }

        imagepng($this->imHandle);
    }

    protected function createImg(){



//        imagerectangle($this->imHandle,$this->borderWidth,$this->daysRegionYStart,$this->borderWidth+$this->daysRegionHeight,$this->imgHeight - $this->volumeImgHeight,$borderColor);
//
//        //成交量分割线
//
//        imagesetthickness($this->imHandle,1);
//        $this->volumeImgHeight = $this->volumeImgHeight ? $this->volumeImgHeight : $this->imgHeight / 4;
//        $volumeLineColor = imagecolorallocate($this->imHandle,186,194,191);

//        //上面一条
//        imageline($this->imHandle,0,$this->imgHeight - $this->volumeImgHeight - $daysRegionHeight,$this->imgWidth - $borderWidth,$this->imgHeight - $this->volumeImgHeight - $daysRegionHeight,$volumeLineColor);
//        //下面一条
//        imageline($this->imHandle,0,$this->imgHeight - $this->volumeImgHeight,$this->imgWidth - $borderWidth,$this->imgHeight - $this->volumeImgHeight,$volumeLineColor);
//
//        imagestring($this->imHandle, 2, 4, $this->imgHeight - $this->volumeImgHeight - $daysRegionHeight, "2016-08-08", $borderColor);
    }

    protected function unitPxPrice(){
        usort($this->datasource,function($a,$b){
            if($a[$this->high] == $b[$this->high]){
                return 0;
            }
            return $a[$this->high] > $b[$this->high] ? 1 : -1;
        });
        $highest = $this->datasource[0][$this->high];
        $lowest = $this->datasource[0][$this->low];
        $unitPxPrice = $this->height / ($highest - $lowest);
        return $unitPxPrice;
    }

    public function __destruct()
    {
        imagedestroy($this->imHandle);
    }

}