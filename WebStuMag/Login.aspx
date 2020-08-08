<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebStuMag.Login" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录界面</title>
    <%--CSS样式链接--%>
    <link href="./CSS/stylesheet.css" rel="stylesheet" />
</head>
<body>
    <form runat="server" class="login-box">
        <h1>&nbsp;&nbsp;&nbsp;&nbsp; 学生信息管理系统</h1>
        <div class="textbox">
            <asp:Table ID="Table1" runat="server" Width="243px">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label1" runat="server" Text=" 用户名：" Width="80px" ForeColor="Black"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="tbUser" runat="server" ForeColor="Black" BorderStyle="Ridge" Width="250px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
        <div class="textbox">
            <asp:Table ID="Table2" runat="server" Width="270px">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label2" runat="server" Text="密码：" Width="80px" ForeColor="Black"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="tbPassword" runat="server" ForeColor="Black"  BorderStyle="Ridge" Width="250px" EnableViewState="False" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
        <div align=center>
         <asp:Button ID="log" Text="登录" runat="server" Width="63px" Height="26px" OnClick="log_Click" />
        </div>

        <p>
            <asp:CheckBox ID="CheckBox1" runat="server" Text="7天内免登录" />
        </p>

    </form>
</body>
</html>
