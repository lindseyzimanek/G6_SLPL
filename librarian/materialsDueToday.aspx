<%@ Page Title="Materials Due Today" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="materialsDueToday.aspx.vb" Inherits="librarian_materialsDueToday" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">Materials Due Today
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" DeleteCommand="DELETE FROM [slpl_check_out_materials] WHERE [CheckOutID] = @CheckOutID" InsertCommand="INSERT INTO [slpl_check_out_materials] ([UserID], [MaterialID], [CheckOutDate], [DateDueBack]) VALUES (@UserID, @MaterialID, @CheckOutDate, @DateDueBack)" SelectCommand="SELECT * FROM [slpl_check_out_materials]" UpdateCommand="UPDATE [slpl_check_out_materials] SET [UserID] = @UserID, [MaterialID] = @MaterialID, [CheckOutDate] = @CheckOutDate, [DateDueBack] = @DateDueBack WHERE [CheckOutID] = @CheckOutID">
    <DeleteParameters>
        <asp:Parameter Name="CheckOutID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="UserID" Type="Object" />
        <asp:Parameter Name="MaterialID" Type="Int32" />
        <asp:Parameter Name="CheckOutDate" Type="DateTime" />
        <asp:Parameter Name="DateDueBack" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="UserID" Type="Object" />
        <asp:Parameter Name="MaterialID" Type="Int32" />
        <asp:Parameter Name="CheckOutDate" Type="DateTime" />
        <asp:Parameter Name="DateDueBack" Type="DateTime" />
        <asp:Parameter Name="CheckOutID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<asp:GridView ID="GridView1" runat="server" CssClass="cssgridview" AutoGenerateColumns="False" DataKeyNames="CheckOutID" DataSourceID="SqlDataSource1" AllowPaging="True" EmptyDataText="There are no materials due today">
    <Columns>
        <asp:BoundField DataField="CheckOutID" HeaderText="Check Out ID" InsertVisible="False" ReadOnly="True" SortExpression="CheckOutID" />
        <asp:BoundField DataField="UserID" HeaderText="User ID" SortExpression="UserID" />
        <asp:BoundField DataField="MaterialID" HeaderText="Material ID" SortExpression="MaterialID" />
        <asp:BoundField DataField="CheckOutDate" HeaderText="Check Out Date" SortExpression="CheckOutDate" />
        <asp:BoundField DataField="DateDueBack" HeaderText="Date Due Back" SortExpression="DateDueBack" />
    </Columns>
</asp:GridView>
</asp:Content>

