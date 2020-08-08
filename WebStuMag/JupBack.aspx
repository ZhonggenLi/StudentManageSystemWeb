<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JupBack.aspx.cs" Inherits="WebStuMag.JupBack" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>跳转页面</title>
    <script type="text/javascript">
        var i = 5;//设置跳转的时间
        window.onload = function page_cg() {
            document.getElementById("time").innerText = i;
            i--;
            if (i == 0) {
                window.location.href ='login.aspx';  //跳转到指定页面
            }
            setTimeout(page_cg, 1000);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
              您未登录，5秒后自动跳转到登录页面<a href="login.aspx"></a>...还剩<span id="time" style="font-weight: bold; color: red"></span>秒！
            <br />
        </div>
    </form>
</body>
</html>

