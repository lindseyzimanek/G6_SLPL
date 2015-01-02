<%@ Page Title="Resource Details" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="resourcedetails.aspx.vb" Inherits="librarian_resource_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">Material Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" 
        SelectCommand="SELECT * FROM [slpl_materials] WHERE ([MaterialID] = @MaterialID)" 
        DeleteCommand="DELETE FROM [slpl_materials] WHERE [MaterialID] = @MaterialID" 
        InsertCommand="INSERT INTO [slpl_materials] ([Title], [Author], [Publisher], [Copyright], [ISBN], [MaterialType], [Description], [CallNumber], [Available]) VALUES (@Title, @Author, @Publisher, @Copyright, @ISBN, @MaterialType, @Description, @CallNumber @Available)" 
        UpdateCommand="UPDATE [slpl_materials] SET [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher, [Copyright] = @Copyright, [ISBN] = @ISBN, [MaterialType] = @MaterialType, [Description] = @Description, [CallNumber] = @CallNumber, [Available] = @Available WHERE [MaterialID] = @MaterialID">

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
        <SelectParameters>
            <asp:QueryStringParameter Name="MaterialID" QueryStringField="MaterialID" Type="Int32" />
        </SelectParameters>
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


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" SelectCommand="SELECT slpl_patrons.UserID, slpl_patrons.FirstName, slpl_patrons.LastName, slpl_patrons.Birthdate, slpl_patrons.Address1, slpl_patrons.Address2, slpl_patrons.City, slpl_patrons.State, slpl_patrons.Zip, slpl_patrons.MainPhoneNumber, slpl_patrons.PrimaryEmail FROM slpl_check_out_materials INNER JOIN slpl_patrons ON slpl_check_out_materials.UserID = slpl_patrons.UserID WHERE (slpl_check_out_materials.MaterialID = @MaterialID)">
        <SelectParameters>            
            <asp:QueryStringParameter Name="MaterialID" QueryStringField="MaterialID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <p></p>
  
    <asp:Label ID="lbl_deleted" CssClass="delete" runat="server"></asp:Label>


    <asp:FormView ID="fv_resourcedetails" runat="server" CssClass="cssformview" DataKeyNames="MaterialID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>

            <table>
                <tr>
            <td>Material ID:</td>
            <td><asp:Label ID="MaterialIDLabel1" runat="server" Text='<%# Eval("MaterialID") %>' /></td>
            </tr>
                <tr>
            <td>Title:</td>
            <td><asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' /></td>
            </tr><tr>
            <td>Author:</td>
            <td><asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' /></td>
            </tr><tr>
            <td>Publisher:</td>
            <td><asp:TextBox ID="PublisherTextBox" runat="server" Text='<%# Bind("Publisher") %>' /></td>
            </tr><tr>
            <td>Copyright:</td>
            <td><asp:TextBox ID="CopyrightTextBox" runat="server" Text='<%# Bind("Copyright") %>' /></td>
            </tr><tr>
            <td>ISBN:</td>
            <td><asp:TextBox ID="ISBNTextBox" runat="server" Text='<%# Bind("ISBN") %>' /></td>
            </tr><tr>
            <td>Material Type:</td>
            <td>
                
                <asp:DropDownList ID="materialtype_dropdown" runat="server" DataSourceID="ds_resourcetype" DataTextField="resource_type" DataValueField="resource_type" selectedvalue='<%# Bind("MaterialType") %>' ></asp:DropDownList>


            </td>
            </tr><tr>
            <td>Description:</td>
            <td><asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' /></td>
            </tr><tr>
            <td>Call Number:</td>
            <td><asp:TextBox ID="CallNumberTextBox" runat="server" Text='<%# Bind("CallNumber") %>' /></td>
            </tr><tr>
            <td>Available:</td>
            <td><asp:Label ID="AvailableLabel" runat="server" Text='<%# Bind("Available") %>' /></td>
            </tr>
            <tr>
            <td><asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" /></td>
            <td><asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td>
            </tr>
                </table>
                
                </EditItemTemplate>
        <InsertItemTemplate>
            
        </InsertItemTemplate>
        <ItemTemplate>
             <table>
                 <tr>
                     <td></td>
                     <td style="text-align:left;">

                         <asp:DataList ID="ISBNDataList" runat="server" DataSourceID="SQLDataSource1">
                <ItemTemplate>

                <a href='<%# Eval("ISBN", "../pics/{0}.jpg")%>' target="_blank">

                    <asp:Image ID="item_image" runat="server" 
                    ImageUrl='<%# Eval("ISBN", "~/pics/{0}.jpg")%>' 
                    Height="200px"
                    AlternateText='<%# Eval("Title")%>'
                    ToolTip='<%# Eval("Title")%>'
                    />
               
                </a>

                </ItemTemplate>
            </asp:DataList>
                        
                     </td>
                 </tr>
                <tr>
            <td>MaterialID:</td>
            <td><asp:Label ID="MaterialIDLabel" runat="server" Text='<%# Eval("MaterialID") %>' /></td>
            </tr><tr>
            <td>Title:</td>
            <td><asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' /></td>
            </tr><tr>
            <td>Author:</td>
            <td><asp:Label ID="AuthorLabel" runat="server" Text='<%# Bind("Author") %>' /></td>
            </tr><tr>
            <td>Publisher:</td>
            <td><asp:Label ID="PublisherLabel" runat="server" Text='<%# Bind("Publisher") %>' /></td>
            </tr><tr>
            <td>Copyright:</td>
            <td><asp:Label ID="CopyrightLabel" runat="server" Text='<%# Bind("Copyright") %>' /></td>
            </tr><tr>
            <td>ISBN:</td>
            <td><asp:Label ID="ISBNLabel" runat="server" Text='<%# Bind("ISBN") %>' /></td>
            </tr><tr>
            <td>MaterialType:</td>
            <td><asp:Label ID="MaterialTypeLabel" runat="server" Text='<%# Bind("MaterialType") %>' /></td>
            </tr><tr>
            <td>Description:</td>
            <td><asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' /></td>
            </tr><tr>
            <td>CallNumber:</td>
            <td><asp:Label ID="CallNumberLabel" runat="server" Text='<%# Bind("CallNumber") %>' /></td>
            </tr><tr>
            <td>Available:</td>
            <td><asp:Label ID="AvailableLabel" runat="server" Text='<%# Bind("Available") %>' /></td>
            </tr>                 
                 <tr>
            <td><asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" /></td>
            <td><asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?')"/></td>
                </tr>

             </table>
            </ItemTemplate>
            </asp:FormView>

             Checked out by:<br />

             <asp:GridView ID="GridView1" runat="server" CssClass="cssgridview" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource2" EmptyDataText="Item is available">
                 <Columns>
                     <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                     <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                     <asp:BoundField DataField="MainPhoneNumber" HeaderText="Main Phone Number" SortExpression="MainPhoneNumber" />
                     <asp:BoundField DataField="PrimaryEmail" HeaderText="Primary Email" SortExpression="PrimaryEmail" />
                 </Columns>
             </asp:GridView>

        


    <br />
    <asp:SqlDataSource ID="ds_resourcetype" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" SelectCommand="SELECT * FROM [slpl_resourcetypes]"></asp:SqlDataSource>


    <br />
    

</asp:Content>

