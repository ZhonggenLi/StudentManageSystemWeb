<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddScore.aspx.cs" Inherits="WebStuMag.AddScore" %>

<%@ Register Src="Top.ascx" TagName="Top" TagPrefix="uc2" %>   

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <uc2:Top ID="Top1" runat="server" />
        <asp:Button ID="btOn" runat="server" Text="显示表格" OnClick="btOn_Click" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1162px" DataKeyNames="id">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="编号" ReadOnly="True">
                <FooterStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="姓名">
                <FooterStyle HorizontalAlign="Justify" />
                </asp:BoundField>
                <asp:BoundField DataField="mathscore" HeaderText="数学成绩" />
                <asp:BoundField DataField="physcore" HeaderText="物理成绩" />
                <asp:BoundField DataField="csscore" HeaderText="计算机成绩" />
                <asp:BoundField DataField="allscore" HeaderText="总成绩" ReadOnly="True" />
                <asp:CommandField HeaderText="操作">
                <ControlStyle ForeColor="Blue" Width="60px" />
                <FooterStyle ForeColor="#0033CC" />
                </asp:CommandField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <p>
            &nbsp;</p>
        <asp:Label ID="Label1" runat="server" Text="姓名："></asp:Label>
        <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="数学成绩："></asp:Label>
        <asp:TextBox ID="tbMathscore" runat="server"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="物理成绩："></asp:Label>
        <asp:TextBox ID="tbPhyscore" runat="server"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="计算机成绩："></asp:Label>
        <asp:TextBox ID="tbCsscore" runat="server"></asp:TextBox>
        <asp:Button ID="btInsert" runat="server" OnClick="btInsert_Click" Text="插入" />
    </form>
</body>
</html>
