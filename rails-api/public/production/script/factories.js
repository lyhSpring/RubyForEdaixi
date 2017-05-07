/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = 'http://180.76.165.224:3000';
var Product_name = new Array();
$(document).ready(function () {
    getFactories();
});

function showModel(id, name, mobile, email, comment) {
    $('#addFactory').modal('show');
    $('#factorynameinput').val(name);
    $("#mobileinput").val(mobile);
    $("#emailinput").val(email);
    $("#addressinput").val(commrnt);
//    var obj = document.getElementById("idForChangeProduct");
//    for(var i=0;i<obj.length;i++){
//        if(obj.options[i].value==product_id){
//            document.getElementById("idForChangeProduct")[i].selected=true;
//        }
//    }

}
function getFactories() {
    var factoriesTable = $('#factoriesTable').dataTable();
    $.ajax({
        type: "GET",
        url: domain + "/factories/getAllFactories",
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td >" + i + "</td>" +
                        "<td >" + data[i].name + "</td>" +
                        "<td >" + data[i].mobile + "</td>" +
                        "<td >" + data[i].email + "</td>" +
                        "<td >" + data[i].comment + "</td>" +
                        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id + "," + data[i].name + "," + data[i].mobile + "," + data[i].email + "," + data[i].comment + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "编辑" + "</a></td>" +
                        "<td class=\"center\" style=\"display:none\">" + data[i].id + "</td>" +
                        "</tr>";
                    stringfortrlist = stringfortrlist + stringfortr;
                }
            }
            $('#factoriesTableBody').html(stringfortrlist);
        }
    });


}
function addFactories() {
    var factoryId=null;
    var factorynameinput = $("#factorynameinput").val();
    var mobileinput = $("#mobileinput").val();
    var emailinput = $("#emailinput").val();
    var commentinput = $("#addressinput").val();
    if ((factorynameinput == null) || (mobileinput == null) || (emailinput == null)) {
        alert("输入所有信息");
        return;
    }

    var url = domain + "/factories?factory[name]=" + factorynameinput + "&factory[mobile]=" + mobileinput + "&factory[email]=" + emailinput + "&factory[password]=456"
    console.log(url);
    $.ajax({
        type: "POST",
        url: url,
        asys:false,
        dataType: "json",
        data: {},
        success: function (data) {
            if (data) {
                factoryId=data.id
            }
        },
        error: function () {
            alert("add fail！");
            return;
        }
    });
    var address_url= domain+"/addresses?address[comment]="+commentinput+"&address[addressable_id]="+factoryId+"&address[addressable_type]=3";
    $.ajax({
        type: "POST",
        url: address_url,
        asys:false,
        dataType: "json",
        data: {},
        success: function (data) {
            if (data) {
                factoryId=data.id
                alert("add success！");
                getFactories();
            }
        },
        error: function () {
            alert("add fail！");
        }
    });

    $('#addFactory').modal('toggle');
    $("#factorynameinput").val("");
    $("#mobileinput").val("");
    $("#emailinput").val("");
    $("#addressinput").val("");

}

function updateFactory() {
    var priceC = $("#changePriceA").val();
    var priceB = $("#changePriceB").val();
    var priceC = $("#changePriceC").val();
    var priceId = $('#idForPrice').val();
    if ((priceA == null) || (priceB == null) || (priceC == null)) {
        alert("请输入价格");
    }

    var url = domain + "/prices/" + priceId + "?" + "price[price1]=" + priceA + "&price[price2]=" + priceB + "&price[price3]=" + priceC;
    console.log(url);
    $.ajax({
        type: "PUT",
        url: url,
        dataType: "json",
        data: {},
        success: function (data) {
            if (data) {
                alert("updat success！");
                getProduct();
                getPrice();
            }
        },
        error: function () {
            alert("update fail！");
        }
    });
    $('#updateProductPrice').modal('toggle');
    $("#product").val("");
    $("#priceA").val("");
    $("#priceB").val("");
    $("#priceC").val("");
}


