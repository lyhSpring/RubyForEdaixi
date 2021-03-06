/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = 'http://180.76.165.224:3000';
$(document).ready(function () {
    getRegions();
    getPriceRule();
});

function showModel(id, grade, region_id, from_date) {

    $('#addChangePriceRule').modal('show');
    var obj = document.getElementById("regionChangeInput");
    var obj1 = document.getElementById("changeGradeselect");
    for (var i = 0; i < obj.length; i++) {
        if (obj.options[i].value == region_id) {
            document.getElementById("regionChangeInput")[i].selected = true;
        }
    }
    var index = grade - 1;
    obj1[index].selected = true;
    $('#idForPriceRule').val(id);
    $('#single_cal2').val(from_date);
    console.log(from_date);
    console.log($('#single_cal2').val());

}

function getRegions() {
    $.ajax({
        type: "GET",
        url: domain + "/regions/getRegionsStatus1",
        dataType: "json",
        success: function (data) {
            var stringfortrselect = "<option value='1'>" + "全部区域" + "</option>";
            var stringfortrlist="";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var string = "<option value='" + data[i].id + "'>" + data[i].name + "</option>";
                    stringfortrselect = stringfortrselect + string;
                    stringfortrlist = stringfortrlist + string;
                }
            }

            $('#select_regions').html(stringfortrselect);
            $('#regioninput').html(stringfortrlist);
            $('#regionChangeInput').html(stringfortrlist);
        },
        error: function () {
            alert("服务器错误!");
        }
    });

}
function getPriceRule() {
    var priceRulesTable = $('#priceRulesTable').dataTable();
    $.ajax({
        type: "GET",
        url: domain + "/price_rules",
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var date;
                    if (data[i].from_date != null) {
                        date = data[i].from_date.split("T")[0];
                    }
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td class=\"center\">" + i + "</td>" +
                        "<td > price" + data[i].grade + "</td>" +
                        "<td >" + date + "</td>" +
                        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id + "," + data[i].grade + "," + data[i].region_id + ", '" + date + "')\" style=\"font-size:6px;padding:0px 8px;\">" + "编辑" + "</a></td>" +
                        "<td class=\"center hidden-xs\"><a class=\"btn btn-info\" style=\"font-size:5px;padding:0px 8px;\">删除</a></td>" +
                        "<td class=\"center\" style=\"display:none\">" + data[i].id + "</td>" +
                        "</tr>";
                    stringfortrlist = stringfortrlist + stringfortr;
                }
            }

            $('#priceRulesTableBody').html(stringfortrlist);
        },
        error: function () {
            alert("服务器错误!");
        }
    });
}

function getPriceRuleByRegion() {
    var priceRulesTable = $('#priceRulesTable').dataTable();
    var selectIndex = document.getElementById("select_regions").selectedIndex;
    var select_regions = document.getElementById("select_regions").options[selectIndex].value;
    if (select_regions == 1) {
        getPriceRule();
        getRegions();
    } else {
        //todo change the interface name
        $.ajax({
            type: "GET",
            url: domain + "/price_rules/findByRegionId?price_rule[region_id]=" + select_regions,
            dataType: "json",
            success: function (data) {
                var stringfortrlist = "";
                if (data != null) {
                    for (var i = 0; i < data.length; i++) {
                        var date;
                        if (data[i].from_date != null) {
                            date = data[i].from_date.split("T")[0];
                        }
                        var stringfortr = "<tr class=\"gradeX\">" +
                            "<td class=\"center\">" + i + "</td>" +
                            "<td > price" + data[i].grade + "</td>" +
                            "<td >" + date + "</td>" +
                            "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id + "," + data[i].grade + "," + data[i].region_id + ", '" + date + "')\" style=\"font-size:6px;padding:0px 8px;\">" + "编辑" + "</a></td>" +
                            "<td class=\"center hidden-xs\"><a class=\"btn btn-info\" style=\"font-size:5px;padding:0px 8px;\">删除</a></td>" +
                            "<td class=\"center\" style=\"display:none\">" + data[i].id + "</td>" +
                            "</tr>";
                        stringfortrlist = stringfortrlist + stringfortr;
                    }
                }

                $('#priceRulesTableBody').html(stringfortrlist);
            },
            error: function () {
                alert("服务器错误!");
            }
        });
    }
}

function addPriceRule() {
    var fromDate = $("#single_cal4").val();
    console.log("date" + fromDate + "date");
    var date = fromDate.split("/");
    var urlFormDate = date[0];
    if (date.length != 1) {
        urlFormDate = date[2] + "-" + date[0] + "-" + date[1];
    }
    console.log(urlFormDate);
    var selectIndex = document.getElementById("regioninput").selectedIndex;
    var regioninput = document.getElementById("regioninput").options[selectIndex].value;
    var selectIndexForGrade = document.getElementById("gradeselect").selectedIndex;
    var Grade = document.getElementById("gradeselect").options[selectIndexForGrade].value;
    var url = domain + "/price_rules/addNewRule?price_rule[grade]=" + Grade + "&price_rule[region_id]=" + regioninput + "&price_rule[category_id]=1&price_rule[from_date]=" + urlFormDate;
    console.log(url);
    $.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        data: {},
        success: function (data) {
            if (data.id != null) {
                alert("add success！");
                getRegions();
                getPriceRule();
            }
            else
                alert("时间重复!");
        },
        error: function () {
            alert("add fail！");
        }
    });
    $('#addPriceRule').modal('toggle');
    document.getElementById("regioninput").selectedIndex = 0;
    document.getElementById("gradeselect").selectedIndex = 0;
}

function updatePriceRule() {
    var fromDate = $("#single_cal2").val();
    var date = fromDate.split("/");
    var urlFormDate = date[0];
    if (date.length != 1) {
        urlFormDate = date[2] + "-" + date[0] + "-" + date[1];
    }
    var idPriceRule = $("#idForPriceRule").val();
    var selectIndex = document.getElementById("regionChangeInput").selectedIndex
    var regionChangeInput = document.getElementById("regionChangeInput").options[selectIndex].value;
    var selectIndex1 = document.getElementById("changeGradeselect").selectedIndex;
    var changeGradeselect = document.getElementById("changeGradeselect").options[selectIndex1].value;
    console.log($('#single_cal2').val());
    var url = domain + "/price_rules/" + idPriceRule + "?price_rule[from_date]=" + urlFormDate + "&price_rule[grade]=" + changeGradeselect + "&price_rule[category_id]=" + regionChangeInput;
    console.log(url);
    $.ajax({
        type: "PUT",
        url: url,
        dataType: "json",
        data: {},
        success: function (data) {
            if (data.id != null) {
                alert("update success！");
                getRegions();
                getPriceRule();
            } else {
                alert("时间重复");
            }
        },
        error: function () {
            alert("update fail");
        }
    });

    $('#addChangePriceRule').modal('toggle');
    document.getElementById("regioninput").selectedIndex = 0;
    document.getElementById("gradeselect").selectedIndex = 0;
}

