/**
 * Created by wuyanli on 2017/4/12.
 */
var domain='http://180.76.165.224:3000';
$(document).ready(function() {
getProduct();
});

function showModel(id){
     $('#updateProducts').modal('show');
     $('#forProductId').val(id);

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
                    var name="删除";
                    if (data[i].is_del==1){
                        name="恢复";
                    }
                    var stringfortr ="<tr class=\"gradeX\">"+
                    "<td class=\"center\">"+data[i].categories_id+"</td>"+
                    "<td >"+data[i].name+"</td>"+
                    "<td class=\"center\"><img src=\""+data[i].logo+"\"></td>"+
                    "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel("+data[i].id+")\" style=\"font-size:4px;padding:0px 8px;\">"+修改+"</a></td>"+
                    "<td class=\"center hidden-xs\"><a class=\"btn btn-info\" onclick='change("+data[i].id+")' style=\"font-size:4px;padding:0px 8px;\">name</a></td>"+
                    "<td class=\"center\" style=\"display:none\">"+data[i].id+"</td>"+
                    "</tr>";
                    var strforname="<option>"+data[i].name+"</option>";
                    stringforselect = stringforselect + strforname;
                stringfortrlist = stringfortrlist + stringfortr;
                }
            }


            $('#productsTableBody').html(stringfortrlist);
        }
    });
    
    
}
function addProduct() {
    var ProductName=$("#name").val();
     var selectIndex=document.getElementById("selectCategories").selectedIndex;
    var ProductCategories=document.getElementById("selectCategories").options[selectIndex].id;
   $.ajax({
       type: "POST",
       url: domain+"/products?product[name]="+ProductName+"&product[categories_id]="+ProductCategories,
       dataType: "json",
       data:{},
       success: function (data) {
                if(data){
                    alert("add success！");
                    getProduct();
                }
       },
       error:function (data) {
           alert("add fail！");
       }
   });
    $('#addProducts').modal('toggle');
    $("#name").val("");
}

function upadteProduct() {
    var productsId=$("#forProductId").val();
    var ProductName=$("#nameinput").val();
   
    var selectIndex=document.getElementById("selectCategories").selectedIndex;
    var ProductCategories=document.getElementById("selectCategories").options[selectIndex].id;
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
        type: "GET",
        url: domain+"/categories",//
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            for (var i = 0; i < data.length; i++) {
               var strforname="<option id='"+data[i].id+"'>"+data[i].name+"</option>";
                stringfortrlist = stringfortrlist + strforname;
            }
            $('#selectCategories').html(stringfortrlist);
            $('#updateselectCategories').html(stringfortrlist);
        }
    });
}
