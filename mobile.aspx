<%@ Page Title="Mobile Home" Language="VB" MasterPageFile="~/mobile.master" AutoEventWireup="false" CodeFile="mobile.aspx.vb" Inherits="mobile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
South Liberty Public Library<br />
    123 Main Street<br />
    South Liberty, IA 52331
    <br />
    Phone: <a href="tel:+13193353500">319-555-1234</a>
    <p></p>
    E-mail us at: <a href="mailto:info@slpl.org">info@slpl.org</a> 
    <br />

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
    
    Search for material:<br />
    <asp:TextBox ID="tbMaterialSearch" runat="server"></asp:TextBox>
    <asp:Button ID="btnMaterialSearch" runat="server" Text="Search" />

    <p></p>
 <% If IsPostBack Then%>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MaterialID" DataSourceID="SqlDataSource1" CssClass="cssgridview">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="MaterialType" HeaderText="Material Type" SortExpression="MaterialType" />
            <asp:BoundField DataField="Available" HeaderText="Available" SortExpression="Available" />
        </Columns>
    </asp:GridView>

     <% End If%>
</div>

</asp:Content>

