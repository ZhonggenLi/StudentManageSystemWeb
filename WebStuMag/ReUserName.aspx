<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReUserName.aspx.cs" Inherits="WebStuMag.ReUserName" %>
<%@ Register Src="Top.ascx" TagName="Top" TagPrefix="uc2" %>   
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改用户名</title>
</head>
<body>
    <form id="form1" runat="server">
        <uc2:Top ID="Top1" runat="server" />
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="请输入原用户名："></asp:Label>
        <asp:TextBox ID="tbOldName" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label2" runat="server" Text="请输入新用户名："></asp:Label>
            <asp:TextBox ID="tbNewName" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="tbOk" runat="server" OnClick="tbOk_Click" Text="修改" />
    </form>
</body>
</html>
