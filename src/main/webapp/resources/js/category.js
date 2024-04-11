function categoryChange(e) {
        var good_a = ["여성의류", "남성의류", "패션잡화", "명품/브랜드","기타의류/잡화"];
        var good_b = ["스마트폰/태블릿", "노트북/PC", "주방가구/기기", "티비/영상가전","냉장고/세탁기/건조기"];
        var good_c = ["가구", "홈데코", "수납/정리", "침구", "커튼/블라인드"];
        var good_d = ["스킨케어", "클렌징/필링", "메이크업", "향수", "남성화장품"];
        var good_e = ["등산/캠핑", "낚시/낚시용품", "자전거/킥보드", "기타스포츠/레저용품"];
        var target = document.getElementById("good");

        if (e.value == "a") var d = good_a;
        else if (e.value == "b") var d = good_b;
        else if (e.value == "c") var d = good_c;
        else if (e.value == "d") var d = good_d;
        else if (e.value == "e") var d = good_e;

        target.options.length = 0;

        for (x in d) {
          var opt = document.createElement("option");
          opt.value = d[x];
          opt.innerHTML = d[x];
          target.appendChild(opt);
        }
      }