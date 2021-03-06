/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = "http://180.76.165.224:3000";
$(document).ready(function () {
    var couriersTable = $('#couriersTable').dataTable();
    getStops();
    getCouriers();
});


function getCouriers() {
    var station_name = new Array();
    var couriersTable = $('#couriersTable').dataTable();
    $.ajax({
        type: "GET",
        async: false,
        url: domain + "/stations",
        dataType: "json",
        success: function (data) {
            var stringforselect = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var j = data[i].id;
                    parseInt(j);
                    station_name[j] = data[i].name;
                }
            }
        }
    });
    console.log(station_name);
    $.ajax({
        type: "GET",
        url: domain + "/couriers?page=1",
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    console.log(data[i].station_id);
                    var station_names = "";
                    if (data[i].station_id != null) {
                        station_names = station_name[data[i].station_id];
                    }
                    var settled=0;
                    var unsettled=0;
                    var money_settled=0;
                    var money_unsettled=0;
                    if (data[i].settlement!=null){
                        settled=data[i].settlement.settled;
                        unsettled=data[i].settlement.unsettled;
                        money_settled=data[i].settlement.money_settled;
                        money_unsettled=data[i].settlement.money_unsettled;
                    }
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td class=\"center\">" + data[i].id + "</td>" +
                        "<td >" + data[i].name + "</td>" +
                        "<td >" + data[i].mobile + "</td>" +
                        "<td >" + data[i].email + "</td>" +
                        "<td >" + station_names + "</td>" +
                        // "<td >"+data.stops+"</td>"+
                        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id +","+data[i].station_id+ ")\" style=\"font-size:4px;padding:0px 8px;\">" + "修改" + "</a></td>" +
                        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"toPage(" + data[i].id + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "查看" + "</a></td>" +
                        "<td >" + settled + "</td>" +
                        "<td >" + money_settled + "</td>" +
                        "<td >" + unsettled + "</td>" +
                        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" id="+data[i].id+" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel1(" + data[i].id +","+money_unsettled+ ")\" style=\"font-size:4px;padding:0px 8px;\">" + "结算" + "</a></td>" +
                        "</tr>";

                    stringfortrlist = stringfortrlist + stringfortr;
                }
            }
            $('#couriersTableBody').html(stringfortrlist);
        }
    });
}
function toPage(id) {
    var url="waybills.html?id="+id
    window.location.href=url;
}

function showModel(id,station_id) {
    $('#selectStopsModel').modal('show');
    $('#forCouriersId').val(id);
    var obj = document.getElementById("selectStops");
    for (var i = 0; i < obj.length; i++) {
        if (obj.options[i].id == station_id) {
            document.getElementById("selectStops")[i].selected = true;
        }
    }
}
function showModel1(id,count) {
    $('#charge').modal('show');
    $('#forCountId').val(id);
    $('#count').val(count);

}

function save() {
    var id=$('#forCountId').val();
    url="/settlements/valuate?settlement[courier_id]="+id;
    $.ajax({
        type: "POST",
        url: domain + url,
        dataType: "json",
        success: function (data) {
            if (data != null) {
                alert("success");
                $('#charge').modal('toggle');
                getCouriers();
            }
        },
        error:function (data) {
            alert("fail");
        }
    });
}

function getStops() {
    $.ajax({
        type: "GET",
        url: domain + "/stations",
        dataType: "json",
        success: function (data) {
            var stringforselect = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var strforname = "<option id=\"" + data[i].id + "\">" + data[i].name + "</option>";
                    stringforselect = stringforselect + strforname;
                }
            }
            $('#selectStops').html(stringforselect);
        }
    });
}

function saveStops() {
    var userId = $('#forCouriersId').val();
    var selectIndex = document.getElementById("selectStops").selectedIndex;
    var stop = document.getElementById("selectStops").options[selectIndex].id;
    console.log(stop);
    console.log(userId);
    var url=domain+"/couriers/"+userId+"?courier[station_id]="+stop;
    $.ajax({
        type: "PUT",
        url: url,

        dataType: "json",
        success: function (data) {
            alert("修改成功");
        },
        error: function (data) {
            alert("修改失败");
        }
    });
    $('#selectStopsModel').modal('toggle');
    getCouriers();
}



