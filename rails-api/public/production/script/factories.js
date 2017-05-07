/**
 * Created by wuyanli on 2017/4/12.
 */
var domain='http://180.76.165.224:3000';
var Product_name = new Array();
$(document).ready(function() {
    getFactories();
});

function showModel(id,price1,price2,price3,product_id){
     $('#updateProductPrice').modal('show');
     $('#idForPrice').val(id);
     $("#changePriceA").val(price1);
     $("#changePriceB").val(price2);
     $("#changePriceC").val(price3);
//    var obj = document.getElementById("idForChangeProduct");
//    for(var i=0;i<obj.length;i++){
//        if(obj.options[i].value==product_id){
//            document.getElementById("idForChangeProduct")[i].selected=true;
//        }
//    }

     $("#product").val(Product_name[product_id]);
console.log("dddd"+Product_name[product_id]);
}
function getFactories(){
     var factoriesTable = $('#factoriesTable').dataTable();
        $.ajax({
        type: "GET",
        url: domain+"/factories",
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            if(data!=null){
                for(var i = 0; i < data.length; i++){
                    var stringfortr ="<tr class=\"gradeX\">"+
                    "<td >"+i+"</td>"+
                    "<td >"+data[i].name+"</td>"+
                    "<td >"+data[i].mobile+"</td>"+
                    "<td >"+data[i].email+"</td>"+
                    "<td class=\"center hidden-xs\"><a href=\"#table-modal-showTaskSchedual\" data-toggle=\"modal\" class=\"btn btn-info\" onclick=\"showModel("+data[i].id+","+data[i].price1+","+data[i].price2+","+data[i].price3+","+data[i].product_id+")\" style=\"font-size:4px;padding:0px 8px;\">"+"编辑"+"</a></td>"+
                    "<td class=\"center\" style=\"display:none\">"+data[i].id+"</td>"+
                    "</tr>";
                stringfortrlist = stringfortrlist + stringfortr;
                }
            }
            $('#factoriesTableBody').html(stringfortrlist);
        }
    });
    
    
}
function addFactories() {
    var factorynameinput=$("#factorynameinput").val();
    var mobileinput=$("#mobileinput").val();
    var emailinput=$("#emailinput").val();
    if((factorynameinput==null) || (mobileinput==null) || (emailinput==null)){
        alert("输入所有信息");
    }

        var url=domain+"/factories?factory[name]="+factorynameinput+"&factory[mobile]="+mobileinput+"&factory[email]="+emailinput+"&factory[password]=456"
        console.log(url);
   $.ajax({
       type: "POST",
       url:url,
       dataType: "json",
       data:{},
       success: function (data) {
                if(data){
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

}

function updatePrice() {
    var priceC=$("#changePriceA").val();
    var priceB=$("#changePriceB").val();
    var priceC=$("#changePriceC").val();
    var priceId=$('#idForPrice').val();
    if((priceA==null) || (priceB==null) || (priceC==null)){
        alert("请输入价格");
    }

    var url=domain+"/prices/"+priceId+"?"+"price[price1]="+priceA+"&price[price2]="+priceB+"&price[price3]="+priceC;
    console.log(url);
    $.ajax({
        type: "PUT",
        url: url,
        dataType: "json",
        data:{},
        success: function (data) {
            if(data){
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


function getProduct() {
    $.ajax({
        type: "GET",
        async: false,
        url: domain+"/products",
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            for (var i = 0; i < data.length; i++) {
                var j=data[i].id;
                Product_name[j]=data[i].name;
                var strforname="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
                stringfortrlist = stringfortrlist + strforname;

            }
            console.log(stringfortrlist);
            $('#idForProduct').html(stringfortrlist);
            $('#idForChangeProduct').html(stringfortrlist);
        }
    });
}
