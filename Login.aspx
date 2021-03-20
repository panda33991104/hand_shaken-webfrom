<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="hand_shaken_webform.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登入畫面</title>
    <%-- 設定網頁編碼，UTF-8 是萬國碼 --%>
    <meta charset="utf-8" />
    <%--響應式網頁:後面的initial-scale表示初始縮放，maximum-scale表示最大縮放比例，「1」意味著不能進行縮放 --%>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/Style.css" rel="stylesheet" />
    <link href="css/noscript.css" rel="stylesheet" />
    <style type="text/css">
            .auto-style1 {
                width: 389%;
                height: 2.8em;
            }
            .text-danger {
                color: #b94a48;
            }
    </style>
</head>
<body>
    <div id="wrapper">
        <!--Main-->
        <%-- <section> 用來規劃網頁內容的區域 --%>
        <section id="main">
            <%-- 抬頭 --%>
            <%--<header>放網頁內容的標題區域 --%>
            <form id="form1" runat="server">
            <header>
                <%-- Photo --%>
                <span class="avatar"><img src="img/李圓圓.jpg" alt="" /></span>
			    <h1>Login</h1>
	    	</header>
            <%-- 帳號密碼 --%>
                <%-- <ul> 用作項目清單，清單中每個項目使用 <li> 列出 --%>
                 <ul class="icons">
                     <li>
					 <h2>帳號</h2>
                         <asp:TextBox ID="Emp_Id" runat="server" CssClass="auto-style1"></asp:TextBox>
                     <h2>密碼</h2>
                         <!--TextMode="Password":不要顯示密碼-->
                         <asp:TextBox ID="Emp_Passwd" runat="server" TextMode="Password" CssClass="auto-style1"></asp:TextBox>
                         <asp:Label ID="Message" runat="server" ForeColor="red" width="100%"/>
					 </li>
				</ul>
                <%-- 登入button --%>
                <section id="two" class="wrapper style2 special">
                     <div class="inner narrow">
					
						 <!--<div class="form-control narrow">
						 </div>-->
                         <p>
                             <asp:Button ID="Button2" runat="server" Text="登入"  OnClick="Button1_Click"/>
                         </p>
                     </div>
                </section>
			 </form>
        </section>
    </div>
</body>
</html>
