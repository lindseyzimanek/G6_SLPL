<%@ Page Title="Material Search Results" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="searchResults.aspx.vb" Inherits="Library_searchResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">Search Results
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:sqldatasource runat="server" ID="SqlDataSource" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" 
        SelectCommand="SELECT * FROM [slpl_materials] WHERE ([Title] LIKE '%' + @searchterm + '%') OR ([Author] LIKE '%' + @searchterm + '%' ) OR ([Description] Like '%' + @searchterm + '%')"   DeleteCommand="DELETE FROM [slpl_materials] WHERE [MaterialID] = @MaterialID" InsertCommand="INSERT INTO [slpl_materials] ([Title], [Author], [Publisher], [Copyright], [ISBN], [MaterialType], [Description], [CallNumber], [Available]) VALUES (@Title, @Author, @Publisher, @Copyright, @ISBN, @MaterialType, @Description, @CallNumber, @Available)" UpdateCommand="UPDATE [slpl_materials] SET [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher, [Copyright] = @Copyright, [ISBN] = @ISBN, [MaterialType] = @MaterialType, [Description] = @Description, [CallNumber] = @CallNumber, [Available] = @Available WHERE [MaterialID] = @MaterialID">
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
        <SelectParameters>
            <asp:QueryStringParameter Name="searchterm" QueryStringField="searchquery" Type="String" />
        </SelectParameters>
    </asp:sqldatasource>

    <br />

    <h2>Material Search Results</h2>


    <br />
    <asp:GridView ID="GridView1" runat="server" CssClass="cssgridview" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource" Width="523px">
        <Columns>
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="MaterialType" HeaderText="MaterialType" SortExpression="MaterialType" />
            <asp:BoundField DataField="CallNumber" HeaderText="CallNumber" SortExpression="CallNumber" />
            <asp:BoundField DataField="Available" HeaderText="Available" SortExpression="Available" />
            <asp:HyperLinkField DataNavigateUrlFields="MaterialID" DataNavigateUrlFormatString="resourcedetails.aspx?MaterialID={0}" Text="More Info" />
        </Columns>
    </asp:GridView>

    


</asp:Content>

