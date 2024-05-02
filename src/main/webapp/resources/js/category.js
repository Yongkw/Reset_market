function categoryChange(e) {
    // 카테고리에 따른 상품 배열
    var categories = {
        '의류,잡화': ["여성의류", "남성의류", "패션잡화", "명품/브랜드", "기타의류/잡화"],
        '가전': ["스마트폰/태블릿", "노트북/PC", "주방가구/기기", "티비/영상가전", "냉장고/세탁기/건조기"],
        '홈인테리어': ["가구", "홈데코", "수납/정리", "침구", "커튼/블라인드"],
        '뷰티': ["스킨케어", "클렌징/필링", "메이크업", "향수", "남성화장품"],
        '운동용품': ["등산/캠핑", "낚시/낚시용품", "자전거/킥보드", "기타스포츠/레저용품"]
    };

    var target = document.getElementById("good");
    var selectedCategory = categories[e.value];

    // 기존 옵션 제거
    target.innerHTML = '';

    // 새로운 옵션 추가
    selectedCategory.forEach(function(category) {
        var option = document.createElement("option");
        option.value = category;
        option.textContent = category;
        target.appendChild(option);
    });
}
