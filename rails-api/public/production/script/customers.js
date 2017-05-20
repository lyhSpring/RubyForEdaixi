/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = "http://180.76.165.224:3000";
$(document).ready(function() {

    var CustomersTable = $('#CustomersTable').dataTable();
    getUser();
});
function getUser() {
    //if (theRequest['id']!=null) {
    $.ajax({
        type: "GET",
        url: domain + "/users?page=1",
        dataType: "json",
        //async: false,
        success: function (data) {
            var stringfortrlist = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {

                    // var type="用户充值";
                    // switch (data[i].turnover_type){
                    //     case 0:
                    //         type="用户充值";
                    //         break;
                    //     case 1:
                    //         type="系统充值";
                    //         break;
                    //     case 2:
                    //         type="用户消费";
                    //
                    // }
                    var created_at=data[i].card.created_at.split("T")[0];
                    var updated_at=data[i].card.updated_at.split("T")[0];
                    var sort=i+1;
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td >" + data[i].name + "</td>" +
                        "<td >" + data[i].mobile + "</td>" +
                        "<td >" + data[i].email + "</td>" +
                        "<td >" + data[i].card.true_money + "</td>" +
                        "<td >" + data[i].card.fake_money + "</td>" +
                        "<td >" + created_at + "</td>" +
                        "<td >" + updated_at + "</td>" +
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
