/*
 * 	向左走向右走图片变大
 */
$(function(){
	$('.arrow-left').mouseenter(function(){
		$(this).stop().fadeIn(0);
		$('.arrow-right').stop().fadeIn(0);
		clearInterval(show);
		$(this).find('img').stop().animate({"width":"100px","height":"94px","bottom":"5px"},"normal");
		$(this).find('p').stop().css({"color":"yellow"}).animate({"left":"10px","bottom":"18px"});
	}).mouseleave(function(){
		show = setInterval(blink,3000);
		$(this).find('img').stop().animate({"width":"85px","height":"80px","bottom":"0"},"normal");
		$(this).find('p').stop().css({"color":"white"}).animate({"left":"0","bottom":"0"});
	})
	$('.arrow-right').mouseenter(function(){
		$(this).stop().fadeIn(0);
		$('.arrow-left').stop().fadeIn(0);
		clearInterval(show);
		$(this).find('img').stop().animate({"width":"100px","height":"94px","right":"15px","bottom":"5px"},"normal");
		$(this).find('p').stop().css({"color":"yellow"}).animate({"right":"10px","bottom":"18px"});
	}).mouseleave(function(){
		show = setInterval(blink,3000);
		$(this).stop();
		$(this).find('img').stop().animate({"width":"85px","height":"80px","right":"0","bottom":"0"},"normal");
		$(this).find('p').stop().css({"color":"white"}).animate({"right":"0","bottom":"0"});
	})
	function blink(){
		$('.arrow').fadeOut(1500).fadeIn(1500);
	}
	var show = setInterval(blink,3000);
})


/*
 * 获取开放多长时间，并计时
 */
$(function(){
	var startYear=2015;
	var startMonth=8;
	var startDay=12;
	var startHour=10;
	var startMinute=00;
	var startSecond=00;
	var startDate=new Date(startYear,startMonth-1,startDay,startHour,startMinute,startSecond);
	var nowDate=new Date();
	var startAllSecond=startDate.getTime()/1000;
	var nowAllSecond=nowDate.getTime()/1000;
	var passedSecond=parseInt(nowAllSecond-startAllSecond);
	var day=parseInt(passedSecond/86400);
	var hour=parseInt((passedSecond-day*86400)/3600);
	var minute=parseInt((passedSecond-day*86400-hour*3600)/60);
	var second=passedSecond-day*86400-hour*3600-minute*60;
	changeTime();
	setInterval(function(){
		second=second+1;
		if(second>59){
			second=second-60;
			minute=minute+1;
		}
		if(minute>59){
			minute=minute-60;
			hour=hour+1;
		}
		if(hour>23){
			hour=hour-24;
			day=day+1;
		}
		changeTime();
	},1000);
	function changeTime(){
		$('#day .figure').html(day);
		$('#hour .figure').html(hour);
		$('#minute .figure').html(minute);
		$('#second .figure').html(second);
	}
})



/*
 *点击分类
 */
 $(function(){
 	var length = $('.type ul').find('li').length;
 	for(i=0;i<length;i++)
 	{
 		$($('#ty').find('li')[i]).click(function(){
	 		$('#ty').find('li').css({'border':'0','color':'#1ea78d'});
	 		$(this).css({'border-bottom':'3px solid #fff100','color':'#fff100'});
 		});
 	}
 })

/*
 *点击选择select
 */
$(function(){
	var lock = Array(true,true,true);
	function select(a,b,c,n){
		$(a).click(function(){
			$(b).find('li').css('display','block')
			$(b).find('li').stop().animate({'height':'20px'},200,function(){
				lock[n] = false;
			});
			if (lock[n] == false){
				$(b).find('li').css('display','none');
				$(b).find('li').stop().animate({'height':'0'},200,function(){
					lock[n] = true;
				});
			}
		})
		var length = $(b).find('li').length;
		for(i=0;i<length;i++){
			$($(b).find('li')[i]).click(function(){
				$(a).html($(this).html());
				$(b).find('li').css('display','none');
				$(b).find('li').stop().animate({'height':'0'},200);
			});
		}
		$('body').click(function(){
			if (lock[n] == false) {
				$(b).find('li').css('display','none');
				$(b).find('li').stop().animate({'height':'0px'},200,function(){
					lock[n] = true;
				});
			};
		})
	}
	select('.se-date1','.se-date2','#select1',0);
	select('.se-position1','.se-position2','#select2',1);
	select('.se-thing1','.se-thing2','#select3',2);
})

/*
*字体滚动
*/
$(function(){
	function left(){
		$('#never-stop').animate({'left':'-180px'},10000,function(){
			$('#never-stop').css({'left':'180px'});
		})
	}
	left();
	setInterval(function(){left();},10000);
})


/*
*归还
*/
$(function(){
	$('.give-back').click(function(){
		window.location.href="detail.html#conc";
	})
})

/*
*下拉框
*/
$(function(){
	var $$ = function (id) { 
		return document.getElementById(id); 
	} 
	window.onload = function () { 
		slide('btn_select');
		slide('btn_select1');
		slide('btn_select2');
	} 
	function slide(tar){
		var btnSelect = $$(tar); 
		var curSelect = btnSelect.getElementsByTagName("span")[0]; 
		var oSelect = btnSelect.getElementsByTagName("select")[0]; 
		var aOption = btnSelect.getElementsByTagName("option"); 
		var checkValue=$("#se1").val(); 
		$("#se1").val("") ;
		oSelect.onchange = function () { 
			var text=oSelect.options[oSelect.selectedIndex].text; 
			curSelect.innerHTML = text; 
		}  
	}
})