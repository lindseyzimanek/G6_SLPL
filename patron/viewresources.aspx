<%@ Page Title="View All Materials" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="viewresources.aspx.vb" Inherits="librarian_viewresources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">View All Materials
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" SelectCommand="SELECT * FROM [slpl_materials]" DeleteCommand="DELETE FROM [slpl_materials] WHERE [MaterialID] = @MaterialID" InsertCommand="INSERT INTO [slpl_materials] ([Title], [Author], [Publisher], [Copyright], [ISBN], [MaterialType], [Description], [CallNumber], [Available]) VALUES (@Title, @Author, @Publisher, @Copyright, @ISBN, @MaterialType, @Description, @CallNumber, @Available)" UpdateCommand="UPDATE [slpl_materials] SET [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher, [Copyright] = @Copyright, [ISBN] = @ISBN, [MaterialType] = @MaterialType, [Description] = @Description, [CallNumber] = @CallNumber, [Available] = @Available WHERE [MaterialID] = @MaterialID">
        <DeleteParameters>
            <asp:Parameter Name="MaterialID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Publisher" Type="String" />
            <asp:Parameter Name="Copyright" Type="Int32" />
            <asp:Parameter Name="ISBN" Type="Decimal" />
            <asp:Parameter Name="MaterialType" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CallNumber" Type="String" />
            <asp:Parameter Name="Available" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Publisher" Type="String" />
            <asp:Parameter Name="Copyright" Type="Int32" />
            <asp:Parameter Name="ISBN" Type="Decimal" />
            <asp:Parameter Name="MaterialType" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CallNumber" Type="String" />
            <asp:Parameter Name="Available" Type="String" />
            <asp:Parameter Name="MaterialID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />    
    
    Search for a material:
    <asp:TextBox ID="tbMaterialSearch" runat="server"></asp:TextBox>
    <asp:Button ID="btnMaterialSearch" runat="server" Text="Search" />

    <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MaterialID" DataSourceID="SqlDataSource1" CssClass="cssgridview">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
            <asp:BoundField DataField="Available" HeaderText="Available" SortExpression="Available" />
            <asp:HyperLinkField DataNavigateUrlFields="MaterialID" DataNavigateUrlFormatString="resourcedetails.aspx?MaterialID={0}" Text="More Info" />
        </Columns>
    </asp:GridView>

</asp:Content>

