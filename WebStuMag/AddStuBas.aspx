<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStuBas.aspx.cs" Inherits="WebStuMag.AddStuBas" %>
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
       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1162px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="编号" ReadOnly="True">
                <FooterStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="姓名">
                <FooterStyle HorizontalAlign="Justify" />
                </asp:BoundField>
                <asp:BoundField DataField="birthday" HeaderText="出生日期" />
                <asp:BoundField DataField="telnum" HeaderText="电话" />
                <asp:BoundField DataField="gender" HeaderText="性别" />
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
        <asp:Label ID="Label1" runat="server" Text="姓名："></asp:Label>
        <asp:TextBox ID="tbName" runat="server" Width="127px"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="出生日期："></asp:Label>
        <asp:TextBox ID="tbBirth" runat="server" Width="141px"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="电话："></asp:Label>
        <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="性别："></asp:Label>
        <asp:TextBox ID="tbGender" runat="server" Width="68px"></asp:TextBox>
        <asp:Button ID="btInsert" runat="server" OnClick="btInsert_Click" Text="插入" />
    </form>
</body>
</html>
