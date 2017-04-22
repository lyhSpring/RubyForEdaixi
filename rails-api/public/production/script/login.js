/**
 * Created by wuyanli on 2017/4/12.
 */

// var url = location.search; //获取url中"?"符后的字串，只用来控制显示
// var theRequest = new Object();
// if (url.indexOf("?") != -1) {
//     var str = url.substr(1);
//     strs = str.split("&");
//     if(strs[0].split("=")[1]=="error"){
//         alert("您输入的账号密码有误，请重新输入！");
//     }
// }
var domain="http://180.76.165.224:3000";

function submitLoginReq(){
    var username=$("#idinput").val();
    var password=$("#passinput").val();
    var isready=checkTheInput(username,password);
    if(isready){
        var hashforpassword = hex_md5(password);
        $("#passinput").val(password);
        $("#loginForm").submit();}
}




function login(){
   // alert("dddd");
    var username=$("#idinput").val();
    var password=$("#passinput").val();
   // alert(username);
    var url="http://localhost:3000/users/login?user[mobile]="+username+"&&user[password]="+password;
   // alert(url);
 //   alert(password);
    $.ajax({
        type:"POST",
        url: domain+"/users/login?user[mobile]="+username+"&&user[password]="+password,
        data:{},
        dataType: "json",
        success: function (data) {
            if(data!=null){
                window.location.href="index.html";
            }

        },
        error: function(){
            alert("您输入的账号密码有误，请重新输入");
            var username=$("#idinput").val("");
            var password=$("#passinput").val(""); 
        }

        

    });
    
}


function checkTheInput(username,password){
    //初始化上次校验的结果
    $("#inputEmail").css("border-color","#cccccc");
    $("#inputPassword").css("border-color","#cccccc");

    //空值校验
    if(username==""){
        $("#inputEmail").css("border-color","red");
        return false;
    }
    if(password==""){
        $("#inputPassword").css("border-color","red");
        return false;
    }
    return true;
}