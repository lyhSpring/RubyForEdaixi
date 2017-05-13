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


    if (theRequest['id']!=null) {
    $.ajax({
        type: "GET",
        url: domain + "/orders/getOrdersAllInfo?order[id]="+theRequest['id'],
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            if (data != null) {
                    var str="用户名: "+data.user_id +"<br/>";
                    $('#user').html(str);
                    var str="订单号： "+data.id+"<br/> 订单金额: "+data.totalprice+"<br/> 订单状态: "+data.status;
                    $('#bill').html(str);
                    var str="物流单号： "+data['waybills'][0].waybill_id+"<br/> 物流状态: "+data['waybills'][0].status+"<br/> 配送员: "+data[i]['waybills'][0].sender_id;
                    $('#waybill').html(str);
                    for(var j = 0; j < data['item'].length; j++){}
                    var sort=j+1;
                    var item = data['item'];
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td >" + sort + "</td>" +
                        "<td >" + item[j].product_id + "</td>" +
                        "<td >" + item[j].product_number + "</td>" +
                        "<td >" + item[j].total_price + "</td>" +
                       // "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id + ",'" + data[i].name + "',"  + data[i].region_id +","+  data[i].factory_id + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "修改" + "</a></td>" +
                        "</tr>";
                    stringfortrlist = stringfortrlist + stringfortr;
                }

            $('#clothesTableBody').html(stringfortrlist);
        }
    });
}
}





