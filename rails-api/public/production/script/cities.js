/**
 * Created by wuyanli on 2017/4/12.
 */
var domain='http://180.76.165.224:3000';
$(document).ready(function() {
    getCities();

});

function showModel(id){
     $('#updateProducts').modal('show');
     $('#forProductId').val(id);

}

function getCities() {
    var citiesTable = $('#citiesTable').dataTable();
    var stringfortrlist ="<tr class=\"gradeX\">"+
        "<td>"+"wew"+"</td>"+
        "<td class=\"hidden-xs\">"+"海淀"+"</td>"+
        "<td class=\"hidden-xs\">"+"北京交通大学"+"</td>"+
        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel()\" style=\"font-size:4px;padding:0px 8px;\">"+"编辑"+"</a></td>"+
        "<td class=\"center hidden-xs\"><a class=\"btn btn-info\" style=\"font-size:4px;padding:0px 8px;\">删除</a></td>"+
        "+</tr>";
    $('#citiesTable').html(stringfortrlist);

}
function getProduct(){
     var productsTable = $('#productsTable').dataTable();
        $.ajax({
        type: "GET",
        url: domain+"/products",
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            var stringforselect = "";
            if(data!=null){
                for(var i = 0; i < data.length; i++){
                    var stringfortr ="<tr class=\"gradeX\">"+
                    "<td class=\"center\">"+data[i].categories_id+"</td>"+
                    "<td >"+data[i].name+"</td>"+
                    "<td class=\"center\"><img src=\""+data[i].logo+"\"></td>"+
                    "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel("+data[i].id+")\" style=\"font-size:4px;padding:0px 8px;\">"+"修改"+"</a></td>"+
                    "<td class=\"center hidden-xs\"><a class=\"btn btn-info\" style=\"font-size:4px;padding:0px 8px;\">删除</a></td>"+
                    "<td class=\"center\" style=\"display:none\">"+data[i].id+"</td>"+
                    "</tr>";
                    var strforname="<option>"+data[i].name+"</option>";
                    stringforselect = stringforselect + strforname;
                stringfortrlist = stringfortrlist + stringfortr;
                }
            }

            $('#selectCategories').html(stringforselect);
            $('#productsTableBody').html(stringfortrlist);
        }
    });
    
    
}
function addProduct() {
    var ProductName=$("#nameinput").val();
     var selectIndex=document.getElementById("selectCategories").selectedIndex;
    var ProductCategories=document.getElementById("selectCategories").options[selectIndex].text;
    alert(ProductCategories);
//    $.ajax({
//        type: "POST",
//        url: "http://localhost:3000/",//
//        dataType: "json",
//        data:{categoriesName:categoriesName,ProductName:ProductName},
//        success: function (data) {
//                 if(data.data){
//                     alert("add success！");
//                 }else{
//                     alert("add fail");
//                 }
//        }
//    });
    $('#addProducts').modal('toggle');
    $("#nameinput").val("");
}

function upadteProduct() {
    var productsId=$("#forProductId").val();
    var ProductName=$("#nameinput").val();
   
    //var selectIndex=document.getElementById("selectCategories").selectedIndex;
   // var ProductCategories=document.getElementById("selectCategories").options[selectIndex].text;
   if(ProductName==null){
    alert("请输入商品名称");
    return;
   }
   $.ajax({
       type: "PUT",
       url: domain+"/products/"+productsId+".update?product[name]="+ProductName,//
       dataType: "json",
       data:{},
       success: function (data) {
                if(data){
                    alert("update success！");
                    getProduct();
                }else{
                    alert("add fail");
                }
       },
       error: function(){
            alert("update fail");
       }
   });

   getCategories();
   $('#updateProducts').modal('toggle');
    $("#nameinput").val("");
}


function getCategories() {
    $.ajax({
        type: "POST",
        url: "http://localhost:3000/",//
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            for (var i = 0; i < data.data.length; i++) {
               var strforname="<option>"+data.data[i].name+"</option>";
                stringfortrlist = stringfortrlist + strforname;
            }
            $('#selectCategories').html(stringfortrlist);
        }
    });
}
