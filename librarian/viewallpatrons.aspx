<%@ Page Title="View All Patrons" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="viewallpatrons.aspx.vb" Inherits="librarian_viewallpatrons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">View All Patrons
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" 
        DeleteCommand="DELETE FROM [slpl_patrons] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [slpl_patrons] ([UserID], [FirstName], [LastName], [Birthdate], [Address1], [Address2], [City], [State], [Zip], [MainPhoneNumber], [PrimaryEmail]) VALUES (@UserID, @FirstName, @LastName, @Birthdate, @Address1, @Address2, @City, @State, @Zip, @MainPhoneNumber, @PrimaryEmail)" 
        SelectCommand="SELECT * FROM [slpl_patrons]" 
        UpdateCommand="UPDATE [slpl_patrons] SET [FirstName] = @FirstName, [LastName] = @LastName, [Birthdate] = @Birthdate, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [State] = @State, [Zip] = @Zip, [MainPhoneNumber] = @MainPhoneNumber, [PrimaryEmail] = @PrimaryEmail WHERE [UserID] = @UserID">
       
         <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Object" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserID" Type="Object" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter DbType="Date" Name="Birthdate" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zip" Type="Decimal" />
            <asp:Parameter Name="MainPhoneNumber" Type="Decimal" />
            <asp:Parameter Name="PrimaryEmail" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter DbType="Date" Name="Birthdate" />
            <asp:Parameter Name="Address1" Type="String" />
            <asp:Parameter Name="Address2" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zip" Type="Decimal" />
            <asp:Parameter Name="MainPhoneNumber" Type="Decimal" />
            <asp:Parameter Name="PrimaryEmail" Type="String" />
            <asp:Parameter Name="UserID" Type="Object" />
        </UpdateParameters>
    </asp:SqlDataSource>
  
    <br />

    
Search for a patron:
    <asp:TextBox ID="tbPatronSearch" runat="server"></asp:TextBox>
    <asp:Button ID="btnPatronSearch" runat="server" Text="Search" />

    <p></p>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1" CssClass="cssgridview" AllowSorting="True" EmptyDataText="No results matching that search">
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:BoundField DataField="MainPhoneNumber" HeaderText="Phone Number" SortExpression="MainPhoneNumber" />
            <asp:BoundField DataField="PrimaryEmail" HeaderText="Primary Email" SortExpression="PrimaryEmail" />
            <asp:HyperLinkField DataNavigateUrlFields="UserID" DataNavigateUrlFormatString="patrondetails.aspx?UserID={0}" Text="Select" />
        </Columns>
    </asp:GridView>

</asp:Content>

