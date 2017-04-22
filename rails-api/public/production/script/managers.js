/**
 * Created by wuyanli on 2017/4/12.
 */
$(document).ready(function() {
    var managersTable = $('#managersTable').dataTable();

    
});

function addManager() {
        var ManagerName=$("#nameinput").val();
        var ManagerNumber=$("#numberinput").val();
//    $.ajax({
//        type: "POST",
//        url: "http://localhost:3000/",//
//        dataType: "json",
//        data:{categoriesName:categoriesName},
//        success: function (data) {
//                 if(data.data){
//                     alert("add success！");
//                 }else{
//                     alert("add fail");
//                 }
//        }
//    });
//    getCategories();
    $('#addManagers').modal('toggle');
    $("#nameinput").val("");
}