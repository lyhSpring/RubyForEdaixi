/**
 * Created by wuyanli on 2017/4/12.
 */
var domain = "http://180.76.165.224:3000";
$(document).ready(function () {

    var membersTable = $('#membersTable').dataTable();
    getCard();
});
function getCard() {
    $.ajax({
        type: "GET",
        url: domain + "/users?page=1",
        dataType: "json",
        //async: false,
        success: function (data) {
            var stringfortrlist = "";
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var created_at = data[i].card[0].created_at.split("T")[0];
                    var updated_at = data[i].card[0].updated_at.split("T")[0];
                    var sort = i + 1;
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td >" + sort + "</td>" +
                        "<td >" + data[i].id + "</td>" +
                        "<td >" + data[i].card[0].true_money + "</td>" +
                        "<td >" + data[i].card[0].fake_money + "</td>" +
                        //"<td >" + created_at + "</td>" +
                        // "<td >" + updated_at + "</td>" +
                        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" +data[i].id+ ","+data[i].card[0].id + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "充值" + "</a></td>" +
                        "</tr>";
                    stringfortrlist = stringfortrlist + stringfortr;
                }
            }
            $('#membersTableBody').html(stringfortrlist);
        }
    });
}

function showModel(id,card_id) {
    $('#userid').val(id);
$('#forCardId').val(card_id);
}

function save() {
    var userid = $('#userid').val();
    var falsemoney = $('#falsemoney').val();
    var card_id=$('#forCardId').val();
   $.ajax({
        type: "POST",
        url: domain + "/cards/systemRecharge?card[id]="+card_id+"&card[fake_money]="+falsemoney,
        dataType: "json",
        //async: false,
        success: function (data) {
        alert("success");
            getCard();
        },
       error:function (data) {
           alert("fail");
       }
   });
    $('#userid').val("");
    $('#forCardId').val("");
    $('#falsemoney').val("");
}