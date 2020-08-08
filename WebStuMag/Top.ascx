<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Top.ascx.cs" Inherits="WebStuMag.Top" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<body>
   <%-- <br />
              欢迎<% =Session["username"] %>！
    <br />--%>
        <div>
            <asp:Menu ID="Menu1" runat="server" StaticSubMenuIndent="16px" BackColor="#FFFF99" DynamicEnableDefaultPopOutImage="False" Height="40px" Orientation="Horizontal" StaticEnableDefaultPopOutImage="False" BorderColor="#CCFF99" ForeColor="#000099">
                <Items>
<asp:MenuItem Text="首页" Value="首页" NavigateUrl="~/MainPage.aspx">
</asp:MenuItem>
                    <asp:MenuItem Text="学生基本信息" Value="学生基本信息">
                        <asp:MenuItem NavigateUrl="~/QueStuBas.aspx" Text="查询、修改、删除学生信息" Value="查询、修改、删除学生信息"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/AddStuBas.aspx" Text="添加学生信息" Value="添加学生信息"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="学生成绩" Value="学生成绩">
                        <asp:MenuItem Text="查询、修改、删除学生成绩" Value="查询、修改、删除学生成绩" NavigateUrl="~/QueScore.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="添加学生成绩" Value="添加学生成绩" NavigateUrl="~/AddScore.aspx"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/RankScore.aspx" Text="查看学生成绩排名" Value="查看学生成绩排名"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="用户设置" Value="用户设置">
                        <asp:MenuItem Text="修改用户名" Value="修改用户名" NavigateUrl="~/ReUserName.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="修改密码" Value="修改密码" NavigateUrl="~/RePassword.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
</body>