<%@ Page Title="New Material" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="newresource.aspx.vb" Inherits="librarian_newresource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">Add New Material    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <asp:SqlDataSource ID="ds_materials" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" DeleteCommand="DELETE FROM [slpl_materials] WHERE [MaterialID] = @MaterialID" InsertCommand="INSERT INTO [slpl_materials] ([Title], [Author], [Publisher], [Copyright], [ISBN], [MaterialType], [Description], [CallNumber], [Available]) VALUES (@Title, @Author, @Publisher, @Copyright, @ISBN, @MaterialType, @Description, @CallNumber, @Available)" SelectCommand="SELECT * FROM [slpl_materials]" UpdateCommand="UPDATE [slpl_materials] SET [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher, [Copyright] = @Copyright, [ISBN] = @ISBN, [MaterialType] = @MaterialType, [Description] = @Description, [CallNumber] = @CallNumber, [Available] = @Available WHERE [MaterialID] = @MaterialID">
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
    <asp:SqlDataSource ID="ds_materialtypes" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" SelectCommand="SELECT * FROM [slpl_resourcetypes]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_yesno" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" SelectCommand="SELECT * FROM [slpl.answer]"></asp:SqlDataSource>
    <p></p>
    <asp:Label ID="lbl_status" runat="server" CssClass="delete"></asp:Label>
    
    <asp:FormView ID="fv_newresource" runat="server" CssClass="cssformview" DataKeyNames="MaterialID" DataSourceID="ds_materials" DefaultMode="Insert">
        <EditItemTemplate>
            </EditItemTemplate>
        <InsertItemTemplate>
            <table width="auto">
                <tr>
            <td>Title:(*)</td>
                    <td><asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' Width="250px" /></td>
            <td>
                <asp:RequiredFieldValidator ID="Title_RequiredField" runat="server" ErrorMessage="Please enter valid title" ControlToValidate="TitleTextBox"></asp:RequiredFieldValidator></td>
            </tr>
                <tr><td>
            Author:</td>
            <td><asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' Width="250px" /></td>
                    <td></td>
            </tr>
                <tr>
            <td>Publisher:</td>
            <td><asp:TextBox ID="PublisherTextBox" runat="server" Text='<%# Bind("Publisher") %>' Width="250px" /></td>
                    <td></td>
           </tr>
            <tr><td>Copyright:</td>
            <td><asp:TextBox ID="CopyrightTextBox" runat="server" Text='<%# Bind("Copyright") %>' Width="75px" /></td>
                <td></td>
            </tr>
                <tr>
            <td>ISBN:(*)</td>
            <td><asp:TextBox ID="ISBNTextBox" runat="server" Text='<%# Bind("ISBN") %>' Width="250px" /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="ISBN_RequiredField" runat="server" ErrorMessage="Please enter ISBN" ControlToValidate="ISBNTextBox"></asp:RequiredFieldValidator></td>
            </tr>
                
                <tr>
            <td>Material Type:</td>
            <td>
                <asp:DropDownList ID="materialtype_dropdown" runat="server" DataSourceID="ds_materialtypes" DataTextField="resource_type" DataValueField="resource_type" selectedvalue='<%# Bind("MaterialType") %>' ></asp:DropDownList>
            </td>
                    <td>

                        
                       </td>
            </tr>
                <tr>
            <td>Description:</td>
            <td><asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' Height="75px" TextMode="MultiLine" Width="248px" /></td>
                    <td></td>
            </tr>
                <tr>
            <td>Call Number:(*)</td>
            <td><asp:TextBox ID="CallNumberTextBox" runat="server" Text='<%# Bind("CallNumber") %>' Width="250px" /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="Callnumber_RequiredField" runat="server" ErrorMessage="Please enter Call Number" ControlToValidate="CallNumberTextBox"></asp:RequiredFieldValidator></td>
           </tr>
                <tr>
            <td>Available:</td>
            <td>
                <asp:DropDownList ID="available_DropDownList" runat="server" DatasourceID="ds_yesno" DataTextField="answer" DataValueField="answer" selectedvalue='<%# Bind("Available")%>' ></asp:DropDownList>
                </td>
                    <td></td>
           </tr>
                <tr>
            <td></td>
                    <td>
                        <asp:Button ID="Insertandnew" runat="server" CausesValidation="True" CommandName="Insert" Text="Save + New"  />
                       
                       
                        <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
           
           
        </td><td></td>
                </tr>
                </table>
                
                </InsertItemTemplate>
        <ItemTemplate>
             </ItemTemplate>
    </asp:FormView>
    

</asp:Content>

