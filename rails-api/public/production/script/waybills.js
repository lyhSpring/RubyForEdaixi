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
    var date = new Date();
    var stringfortrlist = "";
    for (var i = 0; i < 5; i++) {
        var sort = i + 1;
        var stringfortr = "<tr class=\"gradeX\">" +
            "<td >" + sort + "</td>" +
            "<td >" + sort + "</td>" +
            "<td >" + date.toLocaleDateString() + "</td>" +
            "<td >" + '北京交通大学' + "</td>" +
            "<td >" + '北京南站' + "</td>" +
            "<td >" + '取件中' + "</td>" +
            //"<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id + ",'" + data[i].name + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "修改" + "</a></td>" +
            "</tr>";
        stringfortrlist = stringfortrlist + stringfortr;
    }
    $('#waybillsTableBody').html(stringfortrlist);

    if (theRequest['id']!=null) {
    // $.ajax({
    //     type: "GET",
    //     url: domain + "/waybills/getAllWaybills",
    //     dataType: "json",
    //     success: function (data) {
    //         var stringfortrlist = "";
    //         if (data != null) {
    //             for (var i = 0; i < data.length; i++) {
    //                 var sort=i+1;
    //                 var stringfortr = "<tr class=\"gradeX\">" +
    //                     "<td >" + sort + "</td>" +
    //                     "<td >" + data[i].id + "</td>" +
    //                     "<td >" + data[i].order_id + "</td>" +
    //                     "<td >" + data[i].get_address + "</td>" +
    //                     "<td >" + data[i].to_address + "</td>" +
    //                     "<td >" + data[i].status + "</td>" +
    //                     "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id + ",'" + data[i].name + "',"  + data[i].region_id +","+  data[i].factory_id + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "修改" + "</a></td>" +
    //                     "</tr>";
    //                 stringfortrlist = stringfortrlist + stringfortr;
    //             }
    //         }
    //         $('#waybillsTableBody').html(stringfortrlist);
    //     }
    // });
}
}

function showModel(id, name, region_id,factory_id) {
    $('#changeStation').modal('show');
    $('#idForStation').val(id);
    $('#stationnamechange').val(name);
    var obj = document.getElementById("regionchange");
    for (var i = 0; i < obj.length; i++) {
        if (obj.options[i].value == region_id) {
            document.getElementById("regionchange")[i].selected = true;
        }
    }
    var obj1 = document.getElementById("regionnamechange");
    for (var i = 0; i < obj.length; i++) {
        if (obj.options[i].id == factory_id) {
            document.getElementById("regionnamechange")[i].selected = true;
        }
    }
}


function updateStation() {
    var idForStation = $('#idForStation').val();
    var stationnamechange = $('#stationnamechange').val();
    var selectIndex = document.getElementById("regionchange").selectedIndex
    var regionchange = document.getElementById("regionchange").options[selectIndex].value;
    var selectIndex1 = document.getElementById("regionnamechange").selectedIndex;
    var regionnamechange = document.getElementById("regionnamechange").options[selectIndex1].id;
    var url = domain + "/stations/" + idForStation + "?station[name]=" + stationnamechange + "&station[region_id]=" + regionchange;
    console.log(url);
    $.ajax({
        type: "PUT",
        url: url,
        dataType: "json",
        data: {},
        success: function (data) {
            if (data.id != null) {
                alert("update success！");
                getStations();
            } else {
                alert(data);
            }
        },
        error: function () {
            alert("update fail");
        }
    });

    $('#changeStation').modal('toggle');
}


function getFactories() {
    $.ajax({
        type: "GET",
        url: domain + "/factories/getAllFactories",
        dataType: "json",
        success: function (data) {
            var stringforselect = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var strforname = "<option id=\"" + data[i].id + "\">" + data[i].factory_name + "</option>";
                    stringforselect = stringforselect + strforname;
                }
            }
            $('#regionnamechange').html(stringforselect);
            $('#regionnameselect').html(stringforselect);
        }
    });

}

function addStations() {
    var stationnameinput = $('#stationnameinput').val();
    var selectIndex = document.getElementById("regioninput").selectedIndex;
    var regioninput = document.getElementById("regioninput").options[selectIndex].value;
    var selectIndex1 = document.getElementById("regionnameselect").selectedIndex;
    var regionnameselect = document.getElementById("regionnameselect").options[selectIndex1].id;
    var station_id;
    console.log(regioninput);
    var url = domain + "/stations?station[name]=" + stationnameinput + "&station[region_id]=" + regioninput;
    $.ajax({
        type: "POST",
        url: url,
        ayas: false,
        dataType: "json",
        success: function (data) {
            station_id = data.id
        },
        error: function (data) {
            alert("add fail");
        }
    });

    //localhost:3000/factory_stations?factory_station[factory_id]=1&factory_station[station_id]=2

    var url2 = domain + "/factory_stations?factory_station[factory_id]=" + regionnameselect + "&factory_station[station_id]=" + station_id;
    $.ajax({
        type: "POST",
        url: url2,
        ayas: false,
        dataType: "json",
        success: function (data) {
            alert("add success");
        },
        error: function (data) {
            alert("add fail");
        }
    });

    $('#addStation').modal('toggle');
    getStations();
}



