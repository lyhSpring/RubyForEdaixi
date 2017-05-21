/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = "http://180.76.165.224:3000";
$(document).ready(function () {
    var recordsTable = $('#recordsTable').dataTable();
    getRecord();
});


function getRecord() {
    //if (theRequest['id']!=null) {
    $.ajax({
        type: "GET",
        url: domain + "/turnovers?page=1",
        dataType: "json",
        //async: false,
        success: function (data) {
            var stringfortrlist = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {

                    var type="消费流水";
                    switch (data[i].turnover_type){
                        case 0:
                            type="消费流水";
                            break;
                        case 1:
                            type="系统充值";
                            break;
                        case 2:
                            type="用户充值";
                        default:
                            type="消费流水";

                    }
                    var sort=i+1;
                    var true_money=0;
                    var fake_money=0;
                    if(data[i].true_money!=null){
                        true_money=data[i].true_money;
                    }
                    if(data[i].fake_money!=null){
                        fake_money=data[i].fake_money;
                    }
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td >" + sort + "</td>" +
                        "<td >" + type + "</td>" +
                        "<td >" + true_money + "</td>" +
                        "<td >" + fake_money + "</td>" +
                        "<td >" + data[i].card_id + "</td>" +
                        //"<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"toPage(" + data[i].id + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "修改" + "</a></td>" +
                        "</tr>";
                    stringfortrlist = stringfortrlist + stringfortr;
                }
            }
            $('#recordsTableBody').html(stringfortrlist);
        }
    });
//}
}



