/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = "http://180.76.165.224:3000";
$(document).ready(function () {
    var waybillsTable = $('#waybillsTable').dataTable();
    getWaybill();
});


function getWaybill() {
    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    // var date = new Date();
    // var stringfortrlist = "";
    // for (var i = 0; i < 5; i++) {
    //     var sort = i + 1;
    //     var stringfortr = "<tr class=\"gradeX\">" +
    //         "<td >" + sort + "</td>" +
    //         "<td >" + sort + "</td>" +
    //         "<td >" + date.toLocaleDateString() + "</td>" +
    //         "<td >" + '北京交通大学' + "</td>" +
    //         "<td >" + '北京南站' + "</td>" +
    //         "<td >" + '取件中' + "</td>" +
    //         //"<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id + ",'" + data[i].name + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "修改" + "</a></td>" +
    //         "</tr>";
    //     stringfortrlist = stringfortrlist + stringfortr;
    // }
    // $('#waybillsTableBody').html(stringfortrlist);

    if (theRequest['id']!=null) {
    $.ajax({
        type: "GET",
        url: domain + "/waybills/getWaybillsByCourierId?waybill[recieve_id]"+theRequest['id'],
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var status="";
                    switch (data[i].status){

                        case 1:
                            status="取件中";
                            break;
                        case 2:
                            status="送往站点";
                            break;
                        case 3:
                            status="送往工厂";
                            break;
                        case 4:
                            status="送回站点";
                            break;
                        case 5:
                            status="送回用户";
                            break;
                        case 6:
                            status="用户确认";
                            break;
                        default:
                            status="取件中";
                            break;
                    }
                    var sort=i+1;
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td >" + sort + "</td>" +
                        "<td >" + data[i].waybill_id + "</td>" +
                        "<td >" + data[i].order_id + "</td>" +
                        "<td >" + data[i].sender_type + "</td>" +
                        "<td >" + data[i].recieve_type + "</td>" +
                        "<td >" + status + "</td>" +
                        //"<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id + ",'" + data[i].name + "',"  + data[i].region_id +","+  data[i].factory_id + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "修改" + "</a></td>" +
                        "</tr>";
                    stringfortrlist = stringfortrlist + stringfortr;
                }
            }
            $('#waybillsTableBody').html(stringfortrlist);
        }
    });
}
}

