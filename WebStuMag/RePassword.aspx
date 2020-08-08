<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RePassword.aspx.cs" Inherits="WebStuMag.RePassword" %>
<%@ Register Src="Top.ascx" TagName="Top" TagPrefix="uc2" %>   
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改密码</title>
</head>
<body>
    <form id="form1" runat="server">
        <uc2:Top ID="Top1" runat="server" />
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="请输入原密码：                "></asp:Label>
        <asp:TextBox ID="tbOldPasw" runat="server" EnableViewState="False"></asp:TextBox>
        <p>
            <asp:Label ID="Label2" runat="server" Text="请输入新密码：       "></asp:Label>
            <asp:TextBox ID="tbNewPasw" runat="server" EnableViewState="False"></asp:TextBox>
        </p>
        <asp:Label ID="Label3" runat="server" Text="再次输入新密码："></asp:Label>
        <asp:TextBox ID="tbNewTwo" runat="server" EnableViewState="False" Width="185px"></asp:TextBox>
        <p>
            <asp:Button ID="tbOk" runat="server" OnClick="tbOk_Click" Text="修改" />
        </p>
    </form>
</body>
</html>
