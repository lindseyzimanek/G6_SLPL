<%@ Page Title="Material Details" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="resourcedetails.aspx.vb" Inherits="librarian_resource_details" %>

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

<p></p>
    <asp:FormView ID="fv_resourcedetails" runat="server" DataKeyNames="MaterialID" CssClass="cssformview" DataSourceID="SqlDataSource1">
        <EditItemTemplate>

            
                
                </EditItemTemplate>
        <InsertItemTemplate>
            
        </InsertItemTemplate>
        <ItemTemplate>
             <table>
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
                     <td></td>
                     <td>

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
                 </table>
          

           

        </ItemTemplate>
    </asp:FormView>



    <br />
    <asp:SqlDataSource ID="ds_resourcetype" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" SelectCommand="SELECT * FROM [slpl_resourcetypes]"></asp:SqlDataSource>


    <br />
    

</asp:Content>

