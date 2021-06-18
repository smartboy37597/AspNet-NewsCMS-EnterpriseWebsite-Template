(function(a){
	a.fn.hoverClass=function(b){
		var a=this;
		a.each(function(c){
			a.eq(c).hover(function(){
				$(this).addClass(b)
			},function(){
				$(this).removeClass(b)
			})
		});
		return a
	};
})(jQuery);

$(function(){
	//导航
	$(".nav li,.scrollbox li,.product li").hoverClass("current");
});

//收藏设置页面（首页）
function addToFavorite(){
	var d="http://www.jsfoot.com/";
	var c="jsfoot代码素材";
	if(document.all){
		window.external.AddFavorite(d,c);
	}else{
		if(window.sidebar){
			window.sidebar.addPanel(c,d,"");
		}else{
			alert("对不起，您的浏览器不支持此操作!\n请您使用菜单栏或Ctrl+D收藏本站。");
		}
	}
}

//设为首页
function SetHome(obj){
	try{
		obj.style.behavior='url(#default#homepage)';
		obj.setHomePage('http://www.jsfoot.com/');
	}catch(e){
		if(window.netscape){
			try{
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
			}catch(e){
				alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
			};
		}else{
			alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将'http://www.sina.com.cn/'设置为首页。");
		};
	};
};