/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = "http://180.76.165.224:3000";
$(document).ready(function () {
    var ordersTable = $('#ordersTable').dataTable();
    getOrder();
});


function getOrder() {
    //if (theRequest['id']!=null) {
    $.ajax({
        type: "GET",
        url: domain + "/orders",
        dataType: "json",
        async: false,
        success: function (data) {
            var stringfortrlist = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var user_name="";
                    var courier_name="";
                    var address="";
                    var status="";
                    switch (data[i].status){
                        case 0:
                            status="待支付";
                            break;
                        case 1:
                            status="待抢单";
                            break;
                        case 2:
                            status="待取件";
                            break;
                        case 3:
                            status="配送中";
                            break;
                        case 4:
                            status="清洗中";
                            break;
                        case 5:
                            status="送回中";
                            break;
                        case 6:
                            status="已完成";
                            break;
                        default:
                            status="取件中";
                            break;
                    }

                    $.ajax({
                        type: "GET",
                        async: false,
                        url: domain + "/users/"+data[i].user_id,
                        dataType: "json",
                        success: function (data) {
                            if (data != null) {
                               user_name=data.name;
                            }
                        }
                    });
                    if(data[i].courier_id!=null){
                    $.ajax({
                        type: "GET",
                        async: false,
                        url: domain + "/couriers/"+data[i].courier_id,
                        dataType: "json",
                        success: function (data) {
                            if (data != null) {
                                courier_name=data.name;
                            }
                        }
                    });}
                    $.ajax({
                        type: "GET",
                        async: false,
                        url: domain + "/addresses/"+data[i].address_id,
                        dataType: "json",
                        success: function (data) {
                            if (data != null) {
                                address=data.comment.split("#")[0];
                            }
                        }
                    });
                    var sort=i+1;
                    if(data[i].courier_id==null){
                        data[i].courier_id="";
                    }
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td >" + data[i].id + "</td>" +
                        "<td >" + status + "</td>" +
                        "<td >" + data[i].totalprice + "</td>" +
                        "<td >" + user_name + "</td>" +
                        "<td >" + address + "</td>" +
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
    url="item.html?id="+id;
    window.location.href=url;
}



