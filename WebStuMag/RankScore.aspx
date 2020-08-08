<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RankScore.aspx.cs" Inherits="WebStuMag.RankScore" %>
<%@ Register Src="Top.ascx" TagName="Top" TagPrefix="uc2" %> 
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查看成绩排名</title>
</head>
<body>
    <form id="form1" runat="server">
        <uc2:Top ID="Top1" runat="server" />
        <asp:Label ID="Label1" runat="server" Text="请选择要输出的成绩排名："></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>数学</asp:ListItem>
            <asp:ListItem>物理</asp:ListItem>
            <asp:ListItem>计算机</asp:ListItem>
            <asp:ListItem>总成绩</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="输出" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="275px" Width="1153px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="编号" ReadOnly="True" />
                <asp:BoundField DataField="name" HeaderText="姓名" ReadOnly="True" />
                <asp:BoundField DataField="mathscore" HeaderText="数学成绩" ReadOnly="True" />
                <asp:BoundField DataField="physcore" HeaderText="物理成绩" ReadOnly="True" />
                <asp:BoundField DataField="csscore" HeaderText="计算机成绩" ReadOnly="True" />
                <asp:BoundField DataField="allscore" HeaderText="总成绩" ReadOnly="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </form>
</body>
</html>
