/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = "http://180.76.165.224:3000";
$(document).ready(function () {
    var ordersTable = $('#ordersTable').dataTable();
    getOrder();
});


function getOrder() {
    // var url = location.search; //获取url中"?"符后的字串
    // var theRequest = new Object();
    // if (url.indexOf("?") != -1) {
    //     var str = url.substr(1);
    //     strs = str.split("&");
    //     for (var i = 0; i < strs.length; i++) {
    //         theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
    //     }
    // }
    // var date = new Date();
    // var stringfortrlist = "";
    // for (var i = 0; i < 5; i++) {
    //     var sort = i + 1;
    //     var stringfortr = "<tr class=\"gradeX\">" +
    //         "<td >" + sort + "</td>" +
    //         "<td >" + sort + "</td>" +
    //         "<td >" + date.toLocaleDateString() + "</td>" +
    //         "<td >" + '22' + "</td>" +
    //         "<td >" + 'wyl' + "</td>" +
    //         "<td >" + '北京交通大学' + "</td>" +
    //         "<td >" + 'lalal' + "</td>" +
    //         "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"toPage(" +sort+ ")\" style=\"font-size:4px;padding:0px 8px;\">" + "查看" + "</a></td>" +
    //         "</tr>";
    //     stringfortrlist = stringfortrlist + stringfortr;
    // }
    // $('#ordersTableBody').html(stringfortrlist);

    //if (theRequest['id']!=null) {
    $.ajax({
        type: "GET",
        url: domain + "/orders",
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var sort=i+1;
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td >" + sort + "</td>" +
                        "<td >" + data[i].id + "</td>" +
                        "<td >" + data[i].status + "</td>" +
                        "<td >" + data[i].washing_status + "</td>" +
                        "<td >" + data[i].totalprice + "</td>" +
                        "<td >" + data[i].user_id + "</td>" +
                        "<td >" + data[i].address_id + "</td>" +
                        "<td >" + data[i].courier_id + "</td>" +
                        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"toPage(" + data[i].id + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "修改" + "</a></td>" +
                        "</tr>";
                    stringfortrlist = stringfortrlist + stringfortr;
                }
            }
            $('#ordersTableBody').html(stringfortrlist);
        }
    });
//}
}

function toPage(id) {
    alert(id);
    url="item.html?id="+id;
    window.location.href=url;
}



