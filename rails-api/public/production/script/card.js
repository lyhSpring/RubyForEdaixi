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
                    // if (data[i].card.created_at!=null) {
                    //     var created_at = data[i].card.created_at.split("T")[0];
                    //
                    // }
                    // if (data[i].card.updated_at!=null) {
                    //     var updated_at = data[i].card.updated_at.split("T")[0];
                    //
                    // }
                    var true_money="";
                    var fake_money="";
                    var card_id=""
                    if(data[i].card!=null){
                        true_money=data[i].card.true_money;
                        fake_money=data[i].card.fake_money;
                        card_id=data[i].card.id;

                    }
                    var sort = i + 1;
                    var stringfortr = "<tr class=\"gradeX\">" +
                        "<td >" + sort + "</td>" +
                        "<td >" + data[i].id + "</td>" +
                        "<td >" + true_money + "</td>" +
                        "<td >" + fake_money + "</td>" +
                      //  "<td >" + created_at + "</td>" +
                      //   "<td >" + updated_at + "</td>" +
                        "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel(" +data[i].id+ ","+card_id + ")\" style=\"font-size:4px;padding:0px 8px;\">" + "充值" + "</a></td>" +
                        "</tr>";

                    stringfortrlist = stringfortrlist + stringfortr;
                }
            }
            $('#membersTableBody').html(stringfortrlist);
        }
    });
}

function showModel(id,card_id) {
    $('#charge').modal('show');
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
    $('#charge').modal('toggle');
    $('#userid').val("");
    $('#forCardId').val("");
    $('#falsemoney').val("");
}