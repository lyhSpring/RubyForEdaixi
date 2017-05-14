/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = "http://180.76.165.224:3000";
$(document).ready(function () {
    //$('#title').html(str);
    //$('#bill').html(str);
    //$('#waybill').html(str);

    getItem();
});


function getItem() {
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
    //     var stringfortr = "<tr>" +
    //         "<td >" + sort + "</td>" +
    //         "<td >" + '羽绒服' + "</td>" +
    //         "<td >" + '北京交通大学' + "</td>" +
    //         "<td >" + '北京南站' + "</td>" +
    //         "<td >" + '取件中' + "</td>" +
    //         //"<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id + ",'" + data[i].name + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "修改" + "</a></td>" +
    //         "</tr>";
    //     stringfortrlist = stringfortrlist + stringfortr;
    // }
    // $('#clothesTableBody').html(stringfortrlist);
    //


    if (theRequest['id'] != null) {
        $.ajax({
            type: "GET",
            url: domain + "/orders/getOrdersAllInfo?order[id]=" + theRequest['id'],
            dataType: "json",
            async:"false",
            success: function (data) {
                var stringfortrlist = "";
                var status="";
                if (data != null) {
                    switch (data.status) {
                        case 0:
                            $('#title').html("待付款");
                            status="待付款";
                            break;
                        case 1:
                            $('#title').html("待抢单");
                            status="待抢单";
                            break;
                        case 2:
                            $('#title').html("待取件");
                            status="待取件";
                            break;
                        case 3:
                            $('#title').html("配送中");
                            status="配送中";
                            break;
                        case 4:
                            $('#title').html("清洗中");
                            status="清洗中";
                            break;
                        case 5:
                            $('#title').html("送回中");
                            status="送回中";
                            break;
                        case 6:
                            $('#title').html("已完成");
                            status="已完成";
                            break;
                        default:
                            $('#title').html("待取件");
                            status="待取件";
                            break;
                    }
                    var user_id=data[i].user_id;
                    var user_name="";
                    var user_mobile="";
                    var user_email="";
                    $.ajax({
                        type: "GET",
                        url: domain + "/users/"+user_id,
                        dataType: "json",
                        async: false,
                        success: function (data) {
                            if (data != null) {
                                user_name=data.name;
                                user_email=data.email;
                                user_mobile=data.mobile;
                            }
                        }
                    });
                    var str = "用户名: " + user_name + "<br/>电话： "+user_mobile+"<br/> 邮箱: "+user_email ;
                    $('#user').html(str);
                    var str = "订单号： " + data.id + "<br/> 订单金额: " + data.totalprice + "<br/> 订单状态: " +status;
                    $('#bill').html(str);
                    if (data.waybills.length > 0) {
                        var str = "物流单号： " + data.waybills[0].waybill_id + "<br/> 物流状态: " + data.waybills[0].status + "<br/> 配送员: " + data.waybills[0].sender_id;
                        $('#waybill').html(str);
                    }
                    for (var j = 0; j < data.items.length; j++) {
                        var sort = j + 1;
                        var product="";
                        var product_id=data.items[j].product_id
                        $.ajax({
                            type: "GET",
                            url: domain + "/products/"+product_id,
                            dataType: "json",
                            async: false,
                            success: function (data) {
                                if (data != null) {
                                    product=data.name;
                                }
                            }
                        });
                        var stringfortr = "<tr class=\"gradeX\">" +
                            "<td >" + sort + "</td>" +
                            "<td >" + product + "</td>" +
                            "<td >" + data.items[j].product_number + "</td>" +
                            "<td >" + data.items[j].total_price + "</td>" +
                            // "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id + ",'" + data[i].name + "',"  + data[i].region_id +","+  data[i].factory_id + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "修改" + "</a></td>" +
                            "</tr>";
                        stringfortrlist = stringfortrlist + stringfortr;
                    }
                }
                $('#clothesTableBody').html(stringfortrlist);
            }
        });
    }
}





