/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = 'http://180.76.165.224:3000';
var Product_name = new Array();
$(document).ready(function () {
    getFactories();
});

function showModel(id, name, mobile, email, comment) {
    $('#changeFactory').modal('show');
    $('#idForChangeFactory').val(id);
    $('#factorynameinput').val(name);
    $("#mobileinput").val(mobile);
    $("#emailinput").val(email);
    $("#addressinput").val(comment);
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
        url: domain + "/factories",
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var address=data[i].comment.split("#")[0];

                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td >" + i + "</td>" +
                        "<td >" + data[i].name + "</td>" +
                        "<td >" + data[i].mobile + "</td>" +
                        "<td >" + data[i].email + "</td>" +
                        "<td >" + address + "</td>" +
                        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" + data[i].id +",'"+ data[i].name + "',"+data[i].mobile +",'"+data[i].email +"','"+address+"')\" style=\"font-size:14px;padding:0px 8px;\">" + "编辑" + "</a></td>" +
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
    var factoryId = "";
    var factorynameinput = $("#factorynameinputadd").val();
    var mobileinput = $("#mobileinputadd").val();
    var emailinput = $("#emailinputadd").val();
    var commentinput = $("#addressinputadd").val();
    if ((factorynameinput == null) || (mobileinput == null) || (emailinput == null)) {
        alert("输入所有信息");
        return;
    }
    var url = domain + "/factories?factory[name]=" + factorynameinput + "&factory[mobile]=" + mobileinput + "&factory[email]=" + emailinput + "&factory[password]=456"
    console.log(url);
    $.ajax({
        type: "POST",
        url: url,
        async: false,
        dataType: "json",
        data: {},
        success: function (data) {
            if (data) {
                factoryId = data.id
            }
        },
        error: function () {
            alert("add fail！");
            return;
        }
    });
    if (factoryId != "") {

    var address_url = domain + "/addresses?address[comment]=" + commentinput + "&address[addressable_id]=" + factoryId + "&address[addressable_type]=3";
    $.ajax({
        type: "POST",
        url: address_url,
        async: false,
        dataType: "json",
        data: {},
        success: function (data) {
            if (data) {
                factoryId = data.id
                alert("add success！");
                getFactories();
            }
        },
        error: function () {
            alert("add fail！");
        }
    });
}
    $('#addFactory').modal('toggle');
    $("#factorynameinputadd").val("");
    $("#mobileinputadd").val("");
    $("#emailinputadd").val("");
    $("#addressinputadd").val("");

}

function updateFactory() {
    var factoryId = $('#idForChangeFactory').val();
    var factorynameinput = $("#factorynameinput").val();
    var mobileinput = $("#mobileinput").val();
    var emailinput = $("#emailinput").val();
    var commentinput = $("#addressinput").val();

    var url=domain+"/factories/2?factory[factory_name]="+factorynameinput+"&factory[mobile]="+mobileinput+"&factory[email]="+emailinput;
   // var url = domain + "/prices/" + priceId + "?" + "price[price1]=" + priceA + "&price[price2]=" + priceB + "&price[price3]=" + priceC;
    console.log(url);
    $.ajax({
        type: "PUT",
        url: url,
        dataType: "json",
        data: {},
        success: function (data) {
            if (data) {
                alert("updat success！");
                getFactories();
            }
        },
        error: function () {
            alert("update fail！");
        }
    });
    $('#changeFactory').modal('toggle');
     $("#factorynameinput").val("");
    $("#mobileinput").val("");
   $("#emailinput").val("");
   $("#addressinput").val("");
}


