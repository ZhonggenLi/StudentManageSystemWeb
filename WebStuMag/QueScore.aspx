<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueScore.aspx.cs" Inherits="WebStuMag.QueScore" %>
<%@ Register Src="Top.ascx" TagName="Top" TagPrefix="uc2" %>   

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查询、修改、删除学生成绩</title>
</head>
<body>
    <form id="form1" runat="server">
        <uc2:Top ID="Top1" runat="server" />

        <asp:Table ID="Table1" runat="server" Width="1509px">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" Width="80px">姓名：</asp:TableCell>
                <asp:TableCell runat="server" Width="150px">
                    <asp:TextBox ID="tbName" runat="server" ></asp:TextBox></asp:TableCell>
                <asp:TableCell runat="server" Width="80px"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:Button ID="btQue" runat="server" Text="查询"  OnClick="btQue_Click"/>
                </asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="1162px">
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
                <asp:CommandField HeaderText="操作" ShowDeleteButton="True" ShowEditButton="True">
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
    </form>
</body>
</html>
