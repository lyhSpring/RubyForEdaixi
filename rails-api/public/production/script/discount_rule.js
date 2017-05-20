/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = 'http://180.76.165.224:3000';
$(document).ready(function () {

    getDiscountRule();

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
    obj1[grade].selected = true;
    $('#idForPriceRule').val(id);
    $('#single_cal2').val(from_date);
    console.log(from_date);
    console.log($('#single_cal2').val());

}
function getDiscountRule() {
    var rulesTable = $('#rulesTable').dataTable();
    $.ajax({
        type: "GET",
        url: domain + "//discount_rules?page=1",
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var date;
                    var end_date;
                    if (data[i].from_date != null) {
                        date = data[i].from_date.split("T")[0];

                    }  if (data[i].end_date != null) {
                        end_date = data[i].end_date.split("T")[0];

                    }
                    var type="";
                    switch (data[i].rule_type){
                        case 0:
                            type="消费优惠";
                            break;
                        case 1:
                            type="充值优惠";
                            break;
                        default:
                            type="消费优惠";

                    }
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td class=\"center\">" + i + "</td>" +
                        "<td > " + type + "</td>" +
                        "<td >" + data[i].base_money + "</td>" +
                        "<td >" + data[i].added_money + "</td>" +
                        "<td > " + date + "</td>" +
                        "<td > " + end_date + "</td>" +
                        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id + "," + data[i].grade + "," + data[i].region_id + ", '" + date + "')\" style=\"font-size:6px;padding:0px 8px;\">" + "编辑" + "</a></td>" +
                       // "<td class=\"center hidden-xs\"><a class=\"btn btn-info\" style=\"font-size:5px;padding:0px 8px;\">删除</a></td>" +
                        //"<td class=\"center\" style=\"display:none\">" + data[i].id + "</td>" +
                        "</tr>";
                    stringfortrlist = stringfortrlist + stringfortr;
                }
            }

            $('#rulesTableBody').html(stringfortrlist);
        },
        error: function () {
            alert("服务器错误!");
        }
    });
}

function addDiscountRule() {
    var fromDate = $("#single_cal1").val();
    var endDate = $("#single_cal2").val();
    console.log("date" + fromDate + "date");
    var form_date = fromDate.split("/");
    var end_date = endDate.split("/");
    var urlFormDate1 = form_date[0];
    var urlFormDate2 = end_date[0];
    if (form_date.length != 1) {
        urlFormDate1 = form_date[2] + "-" + form_date[0] + "-" + form_date[1];
    } if (end_date.length != 1) {
        urlFormDate2 = end_date[2] + "-" + end_date[0] + "-" + end_date[1];
    }
    var base_money= $("#base").val();
    var added_money= $("#cut").val();
    var selectIndex = document.getElementById("ruletype").selectedIndex;
    var ruletype = document.getElementById("ruletype").options[selectIndex].value;
   //var selectIndexForGrade = document.getElementById("gradeselect").selectedIndex;
   // var Grade = document.getElementById("gradeselect").options[selectIndexForGrade].value;
    var url = domain + "/discount_rules?discount_rule[rule_type]=" + ruletype + "&discount_rule[base_money]=" + base_money + "&discount_rule[added_money]="+added_money+"&discount_rule[from_date]=" + urlFormDate1+"&discount_rule[end_date]=" + urlFormDate2;
    console.log(url);
    $.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        data: {},
        success: function (data) {
                alert("add success！");

                getDiscountRule();
        },
        error: function () {
            alert("add fail！");
        }
    });

    $('#addRule').modal('toggle');
    document.getElementById("ruletype").selectedIndex = 0;
 $("#base").val("");
 $("#cut").val("");
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
    var url = domain + "/price_rules/" + idPriceRule + "?price_rule[from_date]=" + urlFormDate + "&price_rule[grade]=" + changeGradeselect + "&price_rule[category_id]" + regionChangeInput;
    console.log(url);
    $.ajax({
        type: "PUT",
        url: url,
        dataType: "json",
        data: {},
        success: function (data) {
            if (data.id != null) {
                alert("update success！");
                getPriceRule();
            } else {
                alert(data);
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

