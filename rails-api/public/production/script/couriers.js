/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = "http://180.76.165.224:3000";
$(document).ready(function () {
    var couriersTable = $('#couriersTable').dataTable();

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
        url: domain + "/users/getUsersByRole?user[role]=qs",
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            var stringforselect = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    console.log(data[i].station_id);
                    var station_names = "";
                    if (data[i].station_id != null) {
                        station_names = station_name[data[i].station_id];
                    }
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td class=\"center\">" + data[i].id + "</td>" +
                        "<td >" + data[i].name + "</td>" +
                        // "<td class=\"center hidden-xs\"><a class=\"btn btn-info\" style=\"font-size:4px;padding:0px 8px;\">删除</a></td>"+
                        //  "<td class=\"center\" style=\"display:none\">"+data[i].id+"</td>"+
                        "<td >" + data[i].mobile + "</td>" +
                        "<td >" + data[i].email + "</td>" +
                        "<td >" + station_names + "</td>" +
                        // "<td >"+data.stops+"</td>"+
                        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "修改" + "</a></td>" +
                        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"toPage(" + data[i].id + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "查看" + "</a></td>" +
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

function showModel(id) {
    $('#selectStopsModel').modal('show');
    $('#forCouriersId').val(id);

    getStops();
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
    $.ajax({
        type: "PUT",
        url: domain + "/users/" + userId + ".json?user[station_id]=" + stop,

        dataType: "json",
        success: function (data) {
            alert("添加成功");
        },
        error: function (data) {
            alert("添加失败");
        }
    });
    $('#selectStopsModel').modal('toggle');
    getCouriers();
}



