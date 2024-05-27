$(document).ready(function() {
   
    
    function updateProductList(data) {
        var productList = $("#product-list");
        productList.empty(); // 기존 리스트를 비움

        data.forEach(function(item) {
        	console.log(item.price);
        	console.log(item.product_image);
            var productHtml = ""+
            '<div class="dhgZke" id="product-list">'+
            '<div class="bfphSx">' +
            '<a class="isOWuA" href="productout?prodcut_no=' + item.product_no + '&title=' + item.title + '">' +
                '<input type="hidden" value="' + item.seller_id + '" name="' + item.seller_id + '" id="' + item.seller_id + '">' +
                '<div class="bkngsY">' +
                    '<img src="./image/'+ item.product_image +'" width="194" height="194">' +
                '</div>' +
                '<div class="bJpTlV">' +
                    '<div class="gstNkb">'+item.title+'</div>' +
                    '<div class="cxNmps">' +
                        '<div class="heqdJ">'+ item.price +'</div>' +
                        '<div class="elSbmF"><span> '+item.period +'</span></div>' +
                    '</div>' +
                '</div>' +
                '<div class="esiKrh">' +
                    '<img src="https://m.bunjang.co.kr/pc-static/resource/5dcce33ad99f3020a4ab.png" width="15" height="17">&nbsp'+item.location+'</div>' +
            '</a>' +
        '</div>'+'</div>';

            productList.append(productHtml);
        });
    }
    
        $(".ffPLQP, .dMXLDX, .dMXLDX2").click(function() {
            // 모든 링크의 색상을 검은색으로 변경
            $(".ffPLQP, .dMXLDX, .dMXLDX2").css("color", "black");
            
            // 클릭한 링크의 색상을 빨간색으로 변경
            $(this).css("color", "red");
        });
    
     
   		   
    
});