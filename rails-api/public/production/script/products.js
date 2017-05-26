/**
 * Created by wuyanli on 2017/4/12.
 */
var domain='http://180.76.165.224:3000';
$(document).ready(function() {
    getCategories();
    getProduct();
});
var category_name="";
function showModel(id,category_id,name){
     $('#updateProducts').modal('show');
     $('#nameinput').val(name);
    var obj = document.getElementById("updateselectCategories");
    for (var i = 0; i < obj.length; i++) {
        if (obj.options[i].id == category_id) {
            document.getElementById("regionchange")[i].selected = true;
        }
    }
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
                    var factoriy_name="";
                    if (data[i].categories_id != null) {
                        factoriy_name = category_name[data[i].categories_id];
                    }
                    var stringfortr ="<tr class=\"gradeX\">"+
                    "<td class=\"center\">"+category_name+"</td>"+
                    "<td >"+data[i].name+"</td>"+
                    "<td class=\"center\"><img src=\""+data[i].logo+"\"></td>"+
                    "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel("+data[i].id+","+data[i].categories_id+",'"+data[i].name+"')\" style=\"font-size:4px;padding:0px 8px;\">"+"修改"+"</a></td>"+
                    "<td class=\"center hidden-xs\"><a class=\"btn btn-info\" onclick='change("+data[i].id+","+data[i].is_del+")' style=\"font-size:4px;padding:0px 8px;\">"+name+"</a></td>"+
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

function change(id,is_del) {
    $.ajax({
        type: "PUT",
        url: domain+"/products/"+id+"?product[is_del]="+is_del,//
        dataType: "json",
        data:{},
        success: function (data) {
            if(data){
                alert("update success！");
                getProduct();
            }else{
                alert("update fail");
            }
        },
        error: function(){
            alert("update fail");
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
       url: domain+"/products/"+productsId+".update?product[name]="+ProductName+"product[categories_id]="+ProductCategories,//
       dataType: "json",
       data:{},
       success: function (data) {
                if(data){
                    alert("update success！");
                    getProduct();
                }else{
                    alert("update fail");
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
                for (var i = 0; i < data.length; i++) {
                    var j = data[i].id;
                    parseInt(j);
                    category_name[j] = data[i].name;
                }
               var strforname="<option id='"+data[i].id+"'>"+data[i].name+"</option>";
                stringfortrlist = stringfortrlist + strforname;
            }
            $('#selectCategories').html(stringfortrlist);
            $('#updateselectCategories').html(stringfortrlist);
        }
    });
}
