/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = 'http://180.76.165.224:3000';
$(document).ready(function() {
   // var categoriesTable = $('#categoriesTable').dataTable();
    
    getCategories();
    
    // var stringfortrlist ="<tr class=\"gradeX\">"+
    //     "<td>"+"wew"+"</td>"+
    //     "<td class=\"hidden-xs\">"+"ddd"+"</td>"+
    //     "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"upadteCategories()\" style=\"font-size:4px;padding:0px 8px;\">"+"修改"+"</a></td>"+
    //     "<td class=\"center hidden-xs\"><a class=\"btn btn-info\" style=\"font-size:4px;padding:0px 8px;\">删除</a></td>"+

    //     "+</tr>"+"<tr class=\"gradeX\">"+
    //     "<td>"+"wew"+"</td>"+
    //     "<td class=\"hidden-xs\">"+"ddd"+"</td>"+
    //     "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"upadteCategories()\"style=\"font-size:4px;padding:0px 8px;\">"+"ddd"+"</a></td>"+
    //     "<td class=\"center hidden-xs\"><a class=\"btn btn-info\" onclick=\"deleteCategories()\" style=\"font-size:4px;padding:0px 8px;\">查看</a></td>"+

    //     "+</tr>";
    // $('#categoriesTableBody').html(stringfortrlist);
    //       // Highlight every second row
    // oTable.$('tr:odd').css('backgroundColor', 'blue');
    
} );

function upadteCategories() {
    var categoriesId=$("#forCategoryId").val();
    var categoriesName=$("#inputId").val();
    //var selectIndex=document.getElementById("selectCategories").selectedIndex;
   // var ProductCategories=document.getElementById("selectCategories").options[selectIndex].text;
   if(categoriesName==""){
    alert("请输入品类名称");
    return;
   }
  // alert("http://localhost:3000/categories/"+categoriesId+".update?categories[name]="+categoriesName);
   $.ajax({
       type: "PUT",
       url: domain+ "/categories/"+categoriesId+".update?category[name]="+categoriesName,//
       dataType: "json",
       data:{},
       success: function (data) {
                if(data){
                    alert("update success！");
                    getCategories();
                }else{
                    alert("add fail");
                }
       },
       error: function(){
            alert("update fail");
       }
   });
  $('#upadteCategories').modal('toggle');
   getCategories();
 
    $("#inputId").val("");
}
   
  function showModel(id){
     $('#upadteCategories').modal('show');
     
     $('#forCategoryId').val(id);
   
   }   
function deleteCategories() {
    $.ajax({
        type: "POST",
        url: "http://180.76.165.224:3000/",//
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            for (var i = 0; i < data.data.length; i++) {
                var stringfortr ="<tr class=\"gradeX\">"+
                    "<td >"+data.data[i].name+"</td>"+
                    "<td class=\"center hidden-xs\"></td>"+
                    "<td class=\"center\">"+nodetype+"</td>"+
                    "<td class=\"center hidden-xs\">"+nodestatus+"</td>"+
                    "<td class=\"center hidden-xs\"><a onclick='getTaskByNode(this)' id='"+data.data[i].nodeId+"' class=\"btn btn-info\" style=\"font-size:4px;padding:0px 8px;\">"+data.data[i].taskAmount+"</a></td>"+
                    "<td class=\"center hidden-xs\"><a onclick='clickbutton(this)' id='"+data.data[i].nodeId+"' class=\"btn btn-info\" style=\"font-size:4px;padding:0px 8px;\">详情</a></td>"+
                    "</tr>";
                stringfortrlist = stringfortrlist + stringfortr;
            }
            $('#categoriesTableBody').html(stringfortrlist);
        }
    });
}

function addCategories() {
    var categoriesName=$("#newinput").val();
    if(categoriesName==null){
        alert("请输入品类名");
        return;
    }
    $.ajax({
        type: "POST",
        url: domain+"/categories.json?category[name]="+categoriesName,//
        dataType: "json",
        data:{},
        success: function (data) {
                 if(data!=""){
                     alert("add success！");
                         getCategories();
                 }else{
                     alert("add fail");
                 }
        },
        error: function(){
            alert("add fail");
        }
    });

    $('#addCategoriesModel').modal('toggle');
    $("#nameinput").val("");
}

function getCategories(){
    var categoriesTable = $('#categoriesTable').dataTable();
    $.ajax({
        type: "GET",
        url: domain+"/categories",//
        dataType: "json",
        data:{},
        success: function (data) {
            var stringfortrlist = "";
            if(data!=null){
                for(var i = 0; i < data.length; i++){

                    var stringfortr ="<tr class=\"gradeX\">"+
                    "<td >"+data[i].name+"</td>"+
                    //"<td class=\"center\">"+data[i].logo+"</td>"+
                    "<td class=\"center\"><img src=\""+data[i].logo+"\"></td>"+
                    "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel("+data[i].id+")\" style=\"font-size:4px;padding:0px 8px;\">"+"修改"+"</a></td>"+
                    "<td class=\"center hidden-xs\"><a class=\"btn btn-info\" style=\"font-size:4px;padding:0px 8px;\">删除</a></td>"+
                    "</tr>";
                stringfortrlist = stringfortrlist + stringfortr;
                }
            }
            $('#categoriesTableBody').html(stringfortrlist);
        }
    });
    
}

