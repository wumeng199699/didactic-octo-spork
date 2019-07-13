
var index =0;                   //指当前图片对象
var timer;                       //定时对象

var stateNext = true;
var statePrev = true;
 
$(document).ready(function(){
	var container = $('.mod-tab');   //获取整个轮播图容器对象
    container.mouseover(function(){    //用于鼠标进入轮播图区域停止轮播
        stop();
    });
    container.mouseout(function(){     //用于鼠标离开轮播图区域开始轮播
        play();
    });
	var prev = $('#prev');           //获取左按钮对象
	var next = $('#next');           //获取右按钮对象
    var buttons = $('.gb-tab a');    //获取图片下面的按钮对象
    for (var i = 0; i < buttons.length; i++) {  //循环绑定下面按钮的点击事件
        (function (i) {
             buttons[i].click(function(){
                index = i;
                imgShow(index);
                buttonsShow(index);
                alert("success");
            })
        })(i)
    }
    prev.click(function () {            //点击左按钮轮播图片事件。利用延时器解决无限点击问题。
        if(statePrev){
            index -= 1;
            if (index < 0) {
                index = 4
            }
            imgShow(index);
            buttonsShow(index);
            statePrev = false;
            setTimeout(function(){
                statePrev = true;
            },2000)
        }
    });
 
    next.click(function () {
        //由于上边定时器的作用，index会一直递增下去，我们只有5个小圆点，所以需要做出判断
        if(stateNext){
            index += 1;
            if (index > 4) {
                index = 0;
            }
            imgShow(index);
        buttonsShow(index);
            stateNext = false;
            setTimeout(function(){
                stateNext = true
            },2000)
        }
    });
});
 
function play() {                    //开始轮播函数
    //重复执行的定时器
    timer = setInterval(function () {
        index += 1;
        if (index > 4) {
            index = 0;
        }
            imgShow(index);
        buttonsShow(index);
    }, 4000)
}
 
function stop() {                   //停止轮播函数
    clearInterval(timer);
}
 
function imgShow(index){                 //图片显示函数
	var list = $('#list .tab-con'); //获取与图片相关的<li>对象
    for (var i = 0; i < list.length; i++) {
    	if (i == index){
    		list.eq(i).css("display", "block");
    	}else{
    		list.eq(i).css("display", "none");
    	}
    }
}
 
function buttonsShow(index) {           //图片下面按钮的显示函数。
    //将之前的小圆点的样式清除   
    var buttons = $('.gb-tab a');    //获取图片下面的按钮对象
    for (var i = 0; i < buttons.length; i++) {
    	if (i == index){
    		buttons[i].className = "item2"
    	}else{
    		buttons[i].className = "item";
    	}
    }
}
  play();
