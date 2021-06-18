/**
 * @author Administrator
 */
function initValidator(base){
	
	$("#thisForm").validate({
		onkeyup:false,
		//设置验证规则   
		rules: {
			"userName": {
				required: true,
				userNameCheck: true
			},
			"passWord": {
				required: true,
				rangelength: [6, 12]
			},
			"passWordAgain": {
				required: true,
				rangelength: [6, 12],
				equalTo: "#passWord"
			},
			"corpName": {
				required: true
			},
			"telephone": {
				required: true,
				isTel: true
			},
			"email": {
				required: true,
				isEmail: true
			},
			"mainbody": {
				required: true
			}
		},
		//设置错误信息  
		messages: {
			"userName": {
				required: "请输入用户名",
				userNameCheck: "请输入4-20位字母开头的字母或数字和下划线"
			},
			"passWord": {
				required: "请输入密码",
				rangelength: "密码长度为6-12位"
			},
			"passWordAgain": {
				required: "请再次输入密码",
				rangelength: "密码长度为6-12位",
				equalTo: "两次输入密码不相同"
			},
			"corpName": {
				required: "请输入昵称"
			},
			"telephone": {
				required: "请输入电话号码",
				isMobile: "请输入有效的电话号码"
			},
			"email": {
				required: "请输入邮箱",
				isEmail: "请正确填写邮箱格式"
			},
			"mainbody": {
				required: "请输入正文内容"
			}
		},
		errorElement:"font",
		errorPlacement: function(error, element){
			error.appendTo(element.parent().find(".tipinfo"));
		},success:"valid"
	});

}
