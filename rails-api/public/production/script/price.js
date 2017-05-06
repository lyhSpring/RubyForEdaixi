/**
 * Created by wuyanli on 2017/4/12.
 */
var domain='http://180.76.165.224:3000';
var Product_name = new Array();
$(document).ready(function() {
    getProduct();
    console.log(Product_name);
    getPrice();
});

function showModel(id){
     $('#updateProducts').modal('show');
     $('#forProductId').val(id);

}
function getPrice(){
     var productPriceTable = $('#productPriceTable').dataTable();
        $.ajax({
        type: "GET",
        url: domain+"/prices/?page=1",
        dataType: "json",
        success: function (data) {
            var stringfortrlist = "";
            if(data!=null){
                for(var i = 0; i < data.length; i++){
                    var stringfortr ="<tr class=\"gradeX\">"+
                    "<td class=\"center\">"+Product_name[data[i].product_id]+"</td>"+
                    "<td >"+data[i].price1+"</td>"+
                    "<td >"+data[i].price2+"</td>"+
                    "<td >"+data[i].price3+"</td>"+
                    "<td class=\"center\" style=\"display:none\">"+data[i].id+"</td>"+
                    "<td class=\"center\" style=\"display:none\">"+data[i].product_id+"</td>"+
                    "</tr>";
                stringfortrlist = stringfortrlist + stringfortr;
                }
            }
            $('#productPriceTableBody').html(stringfortrlist);
        }
    });
    
    
}
function addPrice() {

    var priceA=$("#priceA").val();
    var priceB=$("#priceB").val();
    var priceC=$("#priceC").val();
    var priceD=$("#priceD").val();
    var selectIndex=document.getElementById("idForProduct").selectedIndex;
    var ProductId=document.getElementById("idForProduct").options[selectIndex].value;
    var url=domain+"/prices?price[price1]="+priceA+"&price[price2]="+priceB+"&price[price3]="+priceC+"&price[product_id]="+ProductId;
    console.log(url);
   $.ajax({
       type: "POST",
       url: domain+"/prices?price[price1]="+priceA+"&price[price2]="+priceB+"&price[price3]="+priceC+"&price[product_id]="+ProductId,
       dataType: "json",
       data:{},
       success: function (data) {
                if(data){
                    alert("add success！");
                    getProduct();
                    getPrice();
                }
       },
       error: function () {
           alert("add fail！");
       }
   });
    $('#addProductPrice').modal('toggle');
    $("#priceA").val("");
    $("#priceB").val("");
    $("#priceC").val("");
    $("#priceD").val("");
    $("#priceE").val("");
    $("#priceF").val("");
}

function upadtePrice() {
    var productsId=$("#forProductId").val();
    var ProductName=$("#nameinput").val();
    //var selectIndex=document.getElementById("selectCategories").selectedIndex;
   // var ProductCategories=document.getElementById("selectCategories").options[selectIndex].text;
   if(ProductName==null){
    alert("请输入商品名称");
    return;
   }
   $.ajax({
       type: "PUT",
       url: domain+"/products/"+productsId+".update?product[name]="+ProductName,//
       dataType: "json",
       data:{},
       success: function (data) {
                if(data){
                    alert("update success！");
                    getProduct();
                }else{
                    alert("add fail");
                }
       },
       error: function(){
            alert("update fail");
       }
   });

   getCategories();
   $('#updateProducts').modal('toggle');
    $("#nameinput").val("");
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
        }
    });
}
