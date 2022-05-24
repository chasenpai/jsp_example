<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<Style>
        
            *{padding: 0; margin: 0;}
            img{
                display: block;
            }
            
            li{list-style: none;}
            
            body{
                background-color: #4d4d4d;
            }
            
            #wrap{
                width: 1600px;
                overflow: hidden;
                margin: 0 auto;
                position: relative;
            }
            
            nav{
                width: 200px;
                height: 100%;
                position: fixed;
                background-color: #000;
            }
            
            section{
                width: 1400px;
                height: 100%;
                position: relative;
                background-color: lightgray;
                /*float: right;*/
                top:0;
                left:200px;
                overflow: hidden;
            }
            
            .main{
                width: 1120px;  
                position: relative;
                margin: 50px auto;
                height: 399px;
            }
            
            .main img{
                width: 1120px;
                
            }
            
            button{
                width: 100px;
                height: 100px;
                background-color: #000;
                border: none;
                border-radius: 50%;
                color: #fff;
                position: absolute;
                top: 50%;
                left: 50%;
                margin-left: -50px;
                margin-top: -50px;
                
            }
            
            .banner{
                width: 1155px;
                overflow: hidden;
                margin: 30px auto;    
                margin-top: 350px;
                
            }
            
            .banner>img{
                width: 344px;
                height: 350px;
                float: left;
                margin: 0 20px;
                margin-bottom: 40px;
                box-shadow: 3px 3px 5px darkgray;
            }
            
            #header{
                color: white;
                text-align: center;
                margin: 35px;
                font-size: 30px;
            }
            
            ul{
                margin-left: 35px;
                margin-top: 20px
            }
            
            ul a{
                display: inline-block;
                text-decoration:none;
                color: silver;
                font-size: 15px;
                font-weight: bold;
                margin-bottom: 20px;
            }
            
            ul a:hover{
                color: white;
            }
            
            .form {
              width:90px;  
              
              height:20px; 
              float: left;
                margin-left: 20px;
              
            }
            
            .form input[type="text"]{
                width: 90px;
                height: 20px;
                border: 1px solid #aaaaaa;
                background-color: #818181;
              
            }
            
            .search{
                display: inline-block;
                width: 50px;
                height: 20px;
                color: #818181;
                border: 1px solid #aaaaaa;
                font-size: 11px;
                position: absolute;
                bottom: 78px;
            }
            
            .menu01{
                color:white;
                display: inline-block;
                font-size: 22px;
                font-weight: bold;
                margin-bottom: 20px;
            }
            #main:link{
                text-decoration-line: none;
            }
            
        </Style>
</head>
<body>
        
        <!--전체박스-->
        <div id="wrap">
            <nav>
                <a id="main" href="index.html"><h1 id="header">LAPTOP<br/>ZONE</h1></a>
                <ul>
                     <li><p class="menu01">MEMBER</p></li>
                    <li><a href="login.html">로그인</a></li>
                    <li><a href="agree.html">회원가입</a></li>
                    <li><a href="cart.html">장바구니</a></li>
                    <li><a href="order.html">주문목록</a></li>
                    <li><a href="mypage.html">마이페이지</a></li>
                    <li><p class="menu01">CATEGORY</p></li>
                    <li><a href="category_all.html">노트북 전체</a></li>
                    <li><a href="category_apple.html">애플 맥북</a></li>
                    <li><a href="category_ultra.html">울트라북</a></li>
                    <li><a href="category_gaming.html">게이밍 노트북</a></li>
                    <li><a href="category_gaming.html">사무용 노트북</a></li>
                    <li><a href="category_etc.html">노트북 주변기기</a></li>
                    <li><p class="menu01">BOARD</p></li>
                    <li><a href="notice.html">공지사항</a></li>
                    <li><a href="review.html">리뷰</a></li>
                    <li><a href="q&a.html">Q&#38;A</a></li>
                </ul>
                <!--
                    <div class="form">
                        <input type="text" name="text"/>                
                    </div>
                    <div class="search">
                         &nbsp;SEARCH
                    </div>-->
                
            </nav>
            
            <section>
                <div class="main">
                    <img src="img/main01.png" alt=""/>
                </div>
                
                <div class="banner">
                    <img src="" alt="대체이미지"/>
                    <img src="" alt="대체이미지"/>
                    <img src="" alt="대체이미지"/>
                    <img src="" alt="대체이미지"/>
                    <img src="" alt="대체이미지"/>
                    <img src="" alt="대체이미지"/>
                    <img src="" alt="대체이미지"/>
                    <img src="" alt="대체이미지"/>
                    <img src="" alt="대체이미지"/>
                    <img src="" alt="대체이미지"/>
                    <img src="" alt="대체이미지"/>
                    <img src="" alt="대체이미지"/>
                </div>
            </section>
        </div>
        <!--//전체박스-->
        
        
        
    </body>
</html>