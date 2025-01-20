<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>도담도담</title>

  <link rel="stylesheet" href="style.css">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script src="jquery.scrollbox.js"></script>
  <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap" rel="stylesheet">

  <script language="javascript" src="js_package.js"></script>

</head>

<body>

<div id="header2">
  <div class="menu2">
    <div id="logo2">
      <header class="top2"><a href="main.jsp"><img src="image/logo.png"></a></header>
    </div>

    <div id="wrap4">
      <nav>
        <ul>
          <li><a href="news.jsp">소식</a></li>
          <li><a href="Products.jsp">상품</a></li>
          <li><a href="search.jsp">식품 알레르기 가이드</a></li>
          <li><a href="foru.jsp">식품 알레르기 맞춤 상품</a></li>
          <li><a href="login.jsp">로그인</a></li>
          <li><a href="insertMember.jsp">회원가입</a></li>
        </ul>
      </nav>
    </div>
    <div id="menu_bar2" class="material-symbols-outlined" onclick="toggleNav()">menu</div>
  </div>
</div>

<div class="kind_wrap">
  <div class="kind_slider">
    <div id="demo5" class="scroll-img2">
      <ul class="slider">
        <li><img src="image/banaer/b1.png?text=1" alt=""></li>
        <li><img src="image/banaer/b2.png?text=2" alt=""></li>
        <li><img src="image/banaer/b3.png?text=3" alt=""></li>
      </ul>
    </div>
  </div>
</div>
<div class="arrow">
  <button class="prev" id="demo5-backward"><span class="material-symbols-outlined">
arrow_back_ios
</span></button>
  <button class="next" id="demo5-forward"><span class="material-symbols-outlined">
arrow_forward_ios
</span></button>
</div>

<script>
  (function($) {
    $(function () {
      $('#demo5').scrollbox({
        direction: 'h',
      });
      $('#demo5-backward').click(function () {
        $('#demo5').trigger('backward');
      });
      $('#demo5-forward').click(function () {
        $('#demo5').trigger('forward');
      });
    });

    function checkBack() {
      $(".ctg li").click(function() {
        $('.ctg li img').each(function() {
          var src = $(this).attr('src');
          src = src.replace('_select', '');
          $(this).attr('src', src);
        });

        var src = $(this).find('img').attr('src');
        src = src.replace('.', '_select.');
        $(this).find('img').attr('src', src);

      });
    }

    $(document).ready(function(){
      $("#best_div").load("bestTop3_1.jsp");

      $(".ctg a").click(function(e){
        e.preventDefault();
        var jsp = $(this).data("jsp");
        $("#best_div").load(jsp);
        $("#best_div").load(jsp, function() {
          $('html, body').animate({
            scrollTop: $("#ctg_M").offset().top
          }, 1000);
        });
      });

      checkBack();
    });
  })(jQuery);

</script>

<div class="news">식품 알레르기 카드 뉴스</div>
<div id="demo4" class="scroll-img">
  <ul>
    <%
      for(int p=1; p<=6; p++){
    %>
    <li><a href="news.jsp"><img src="image/d_news/card_<%=p%>.png"></a></li>
    <%
      }
    %>
  </ul>
</div>

<script>
  $(function () {
    $('#demo4').scrollbox({
      direction: 'h',
      switchItems: 1
    });


    const mForu = document.getElementById("down_btn");
    const foru2T = document.querySelector(".foru_2_T");

    mForu.addEventListener("click", () => {
      foru2T.scrollIntoView({ behavior: "smooth"});
    });
  });
</script>

<div id="m_foru">
  <img src="image/foru/main_foru.png" id="foru_img">
  <div id="down_btn"></div>
  <%
    try {
      String DB_URL="jdbc:mysql://localhost:3306/mydb?serverTimezone=Asia/Seoul";
      String DB_ID="root";
      String DB_PASSWORD="1234";

      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);
  %>
  <div class="foru_2_T"><font style="color:orange; font-size:30px; font-weight:600;">
    <%

      String jsql7 = "SELECT * FROM allergy WHERE allergy != 0 ORDER BY RAND() LIMIT 1;" ;
      PreparedStatement  pstmt7 = con.prepareStatement(jsql7);

      ResultSet rs7 = pstmt7.executeQuery();
      rs7.next();

      String allName = rs7.getString("allName");
      String allergy = rs7.getString("allergy");
    %><%=allName%></font> 알레르기가 있으신 분들께 추천드립니다!</div>

  <div id="cont_3_M">
    <table>
      <tr>
        <%
          String jsql4 = "SELECT DISTINCT prdNo FROM goods a WHERE NOT EXISTS (SELECT 1 FROM allgoods WHERE allergy = ? AND allgoods.prdNo = a.prdNo) ORDER BY RAND() LIMIT 6";

          PreparedStatement  pstmt4 = con.prepareStatement(jsql4);
          pstmt4.setString(1, allergy);

          ResultSet rs4 = pstmt4.executeQuery();

          while(rs4.next()){
            String no = rs4.getString("prdNo");

            String jsql5 = "SELECT * FROM goods WHERE prdNo = ?" ;
            PreparedStatement  pstmt5 = con.prepareStatement(jsql5);
            pstmt5.setString(1, no);

            ResultSet rs5 = pstmt5.executeQuery();
            while(rs5.next()) {

              String prdname =  rs5.getString("prdName");
              String price =  rs5.getString("prdPrice");
              if (price.length() > 3) {
                String newPrice = price.substring(0, price.length() - 3)
                        .concat(",")
                        .concat(price.substring(price.length() - 3));
                price = newPrice;
              }
              String ex =  rs5.getString("prdEx");
        %>
        <td>
          <div class="cont_3_M">
            <table class="hover_all3">
              <tr>
                <td colspan=2>
                  <a href="viewDetailProduct.jsp?prdNo=<%=no%>">
                    <div id="hover_all3">
                      알레르기 유발 식품<br><br>
                      <%
                        String jsql8 = "select * from allgoods where prdNo = ?";
                        PreparedStatement pstmt8  = con.prepareStatement(jsql8);
                        pstmt8.setString(1, no);

                        ResultSet rs8 = pstmt8.executeQuery();

                        while(rs8.next()){
                          String allNo = rs8.getString("allergy");

                          String jsql9 = "select * from allergy where allergy = ?";
                          PreparedStatement pstmt9  = con.prepareStatement(jsql9);
                          pstmt9.setString(1, allNo);

                          ResultSet rs9 = pstmt9.executeQuery();
                          rs9.next();

                          String allName2 = rs9.getString("allName");
                      %>
                      <b>&nbsp;<%=allName2%>&nbsp;</b>
                      <%
                        }
                      %>
                    </div>
                    <img src="image/f_img/<%=no%>.png" width="100" height="100" border=0></a></td>
              </tr>
              <tr><td colspan=2><%=ex%></td></tr>
              <tr><td><%=prdname%></td><td><%=price%> 원</td></tr>
            </table>
          </div>
        </td>
        <%
            }
          }
        %>
      </tr></table>
  </div>
</div>

<%
  String jsql = "SELECT DISTINCT prdNo FROM goods a WHERE NOT EXISTS (SELECT 1 FROM allgoods WHERE allergy = ? AND allgoods.prdNo = a.prdNo) ORDER BY RAND() LIMIT 1";

  PreparedStatement  pstmt = con.prepareStatement(jsql);
  pstmt.setString(1, allergy);

  ResultSet rs = pstmt.executeQuery();

  while(rs.next()) {
    String no = rs.getString("prdNo");

    String jsql9 = "SELECT * FROM goods WHERE prdNo = ?" ;
    PreparedStatement  pstmt9 = con.prepareStatement(jsql9);

    pstmt9.setString(1, no);

    ResultSet rs9 = pstmt9.executeQuery();
    while(rs9.next()) {

      String jsql6 = "select * from ingredient where prdNo = ?";
      PreparedStatement pstmt6  = con.prepareStatement(jsql6);
      pstmt6.setString(1, no);

      ResultSet rs6 = pstmt6.executeQuery();
      rs6.next();

      double car = rs6.getDouble("car");
      double pro = rs6.getDouble("pro");
      double tFat = rs6.getDouble("tFat");

      double carP = (car / 108) * 100;
      int rcP = (int) Math.round(carP);
      double proP = (pro / 18.3) * 100;
      int rpP = (int) Math.round(proP);
      double tFatP = (tFat / 18) * 100;
      int rfP = (int) Math.round(tFatP);

      String prdname =  rs9.getString("prdName");
      String price =  rs9.getString("prdPrice");
      if (price.length() > 3) {
        String newPrice = price.substring(0, price.length() - 3)
                .concat(",")
                .concat(price.substring(price.length() - 3));
        price = newPrice;
      }
      String ex =  rs9.getString("prdEx");

      String jsql10 = "SELECT * FROM allergy WHERE allergy = ?" ;
      PreparedStatement  pstmt10 = con.prepareStatement(jsql10);
      pstmt10.setString(1, allergy);

      ResultSet rs10 = pstmt10.executeQuery();
      rs10.next();

      String allname3 =  rs10.getString("allName");
%>

<div id="m_new">
  <div class="m_new">
    <table>
      <tr>
        <td colspan=3 style="font-family: 'Tenada';"><%=allname3%> 없는 NEW</td>

        <td rowspan=8 id="new_img"><a href="viewDetailProduct.jsp?prdNo=<%=no%>"><img src="image/f_img/<%=no%>.png" width="100" height="100" border=0></a></td>
      </tr>

      <tr>
        <td colspan=2><div class="m_new_T2"><%=prdname%></div></td>
        <td style="text-align:right;"><%=price%> 원</td></tr>
      <tr>
        <td colspan=3>
          <div class="detail_ingre3"><img src="image/ingre_color.jpg">
            <div class="detail_ingre4"><img src="image/ingre_infor2.jpg">
            </div></div>
        </td>
      </tr>
      <tr>
        <td id="ingre_P">탄수화물</td>
        <td id="percent"><%=rcP%> % </td>
        <td>
          <div class="progress-bar">
            <div class="progress" style="width: <%=rcP%>%; <% if(rcP < 85) { %> background-color:#f9d83b;<% } else if(rcP >= 85 && rcP < 100) { %>background-color: #446f56; <% } else if(rcP >= 100 && rcP <= 115){%>width: 100%; background-color:#446f46;<%} else if (rcP > 115){%>background-color:#fb5e44; width: 100%;<%} %>"></div>
          </div>
        </td>
      </tr>
      <tr>
        <td id="ingre_P">지방</td>
        <td id="percent"><%=rfP%> %</td>
        <td>
          <div class="progress-bar">
            <div class="progress" style="width: <%=rfP%>%; <% if(rfP < 85) { %>background-color: #f9d83b;<% } else if(rfP >= 85 && rfP < 100) { %>background-color:  #446f56;<% } else if (rfP >= 100 && rfP <= 115){%>width: 100%; background-color: #446f56;<%} else if (rfP > 115){%>background-color:#fb5e44; width: 100%;<%} %>"></div>
          </div>
        </td>
      </tr>
      <tr>
        <td id="ingre_P">단백질</td>
        <td id="percent"><%=rpP%> %</td>
        <td>
          <div class="progress-bar">
            <div class="progress" style="width: <%=rpP%>%; <% if(rpP < 85) { %> background-color: #f9d83b;<% } else if(rpP >= 85 && rpP < 100) { %>background-color: #446f56; <% } else if (rpP >= 100 && rpP <= 115){%>width: 100%; background-color:#446f56;<%} else if (rpP > 115){%>background-color:#fb5e44; width: 100%;<%} %>"></div>
          </div>
        </td>
      </tr>

      <tr><td colspan=3>알레르기 유발 식품 : <span style="color:orange;">
		<%
          String jsql2 = "select * from allgoods where prdNo = ?";
          PreparedStatement pstmt2  = con.prepareStatement(jsql2);
          pstmt2.setString(1, no);

          ResultSet rs2 = pstmt2.executeQuery();
          while(rs2.next()){
            String allNo = rs2.getString("allergy");

            String jsql3 = "select * from allergy where allergy = ?";
            PreparedStatement pstmt3  = con.prepareStatement(jsql3);
            pstmt3.setString(1, allNo);

            ResultSet rs3 = pstmt3.executeQuery();
            rs3.next();

            String Name = rs3.getString("allName");
        %>
			<b>&nbsp;<%=Name%>&nbsp;</b>
		<%
          }
        %>
			  </span></td>
      </tr>

    </table>
    <%
        }
      }
    %>
  </div>
</div>


<div>
  <div id="m_b"><img src="image/d_market/maket_bg.png"></div>

  <div id="ctg_M"></div>
  <div class="news">카테고리 별 TOP3</div>
  <div id="ctg">
    <ul class="ctg" onchange="checkBack()">
      <a href="#" data-jsp="bestTop3_1.jsp"><li><img src="image/d_market/allP_select.png"></li></a>
      <a href="#" data-jsp="bestTop3.jsp?ctgType=k"><li><img src="image/d_market/kfood.png"></li></a>
      <a href="#" data-jsp="bestTop3.jsp?ctgType=j"><li><img src="image/d_market/jfood.png"></li></a>
      <a href="#" data-jsp="bestTop3.jsp?ctgType=c"><li><img src="image/d_market/cfood.png"></li></a>
      <a href="#" data-jsp="bestTop3.jsp?ctgType=a"><li><img src="image/d_market/afood.png"></li></a>
      <a href="#" data-jsp="bestTop3.jsp?ctgType=d"><li><img src="image/d_market/dfood.png"></li></a>
    </ul>
  </div>
</div>

<div id="best_div"></div>


<%
  } catch (Exception e) {
    out.println(e);
  }
%>
<div id="mainPage">

  <div id="footer"><div class="footer"><br>
    <div id="fLeft">
      <p><span class="footer_Fm"><a href="center.jsp">고객센터</a></span></p>
      <ul>
        <li><span class="footer_F"> 운영시간</span> 08:00am ~ 18:00pm </li>
        <li><span class="footer_F"> 점심시간</span> 12:30pm ~ 13:30pm </li>
        <li><span class="footer_F"> 고객센터 휴무</span> 주말, 공휴일 </li>
      </ul>
    </div>
    <br><br><br>
    <div id="fRight">
      <div id="fRx"><a href="privacy.jsp"><b>개인정보처리방침</b></a> | <a href="news.jsp">회사소개</a> | <a href="sitemap.jsp">사이트맵</a>  | <a href="manager/manager_login.jsp">관리자 로그인</a></div>
      <ul>
        <li>법인명 (상호) : 도담도담(주) | 대표: 김세현 | 전화: 1577-1659</li>
        <li>사업자등록번호 : 150-72-35764 [사업자정보확인]</li>
        <li>개인정보관리책임자 : 김세현, 조현경</li>
      </ul>
    </div>
  </div>

  </div></div>
</div>
</body>
</html>