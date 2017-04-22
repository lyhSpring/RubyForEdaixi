/**
 * Created by wuyanli on 2017/4/12.
 */
$(document).ready(function() {
    var couriersTable = $('#couriersTable').dataTable();
alert("457");
    getCouriers();
});


function getCouriers(){
	     var couriersTable = $('#couriersTable').dataTable();
        $.ajax({
        type: "GET",
        // url: domain+"/users/getUsersByRole?User[role]=qs",
        url: "http://localhost:3000/users/getUsersByRole?user[role]=qs",
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            var stringforselect = "";
            if(data!=null){
                for(var i = 0; i < data.length; i++){
                    var stringfortr ="<tr class=\"gradeX\">"+
                    "<td class=\"center\">"+id+"</td>"+
                    "<td >"+data[i].name+"</td>"+
                    //"<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel("+data[i].id+")\" style=\"font-size:4px;padding:0px 8px;\">"+"修改"+"</a></td>"+
                   // "<td class=\"center hidden-xs\"><a class=\"btn btn-info\" style=\"font-size:4px;padding:0px 8px;\">删除</a></td>"+
                  //  "<td class=\"center\" style=\"display:none\">"+data[i].id+"</td>"+
		"<td >"+data[i].mobile+"</td>"+
                "<td >"+data[i].email+"</td>"+   
		 "</tr>";
                    var strforname="<option>"+data[i].name+"</option>";
                    stringforselect = stringforselect + strforname;
                stringfortrlist = stringfortrlist + stringfortr;
                }
            }

            $('#selectCategories').html(stringforselect);
            $('#couriersTable').html(stringfortrlist);
        }
    });

}


