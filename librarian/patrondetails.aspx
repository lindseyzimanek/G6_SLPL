<%@ Page Title="Patron Details" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="patrondetails.aspx.vb" Inherits="librarian_patrondetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" 
        DeleteCommand="DELETE FROM [slpl_patrons] WHERE [UserId] = @UserID" 
        InsertCommand="INSERT INTO [slpl_patrons] ([UserID], [FirstName], [LastName], [Birthdate], [Address1], [Address2], [City], [State], [Zip], [MainPhoneNumber], [PrimaryEmail]) VALUES (@UserID, @FirstName, @LastName, @Birthdate, @Address1, @Address2, @City, @State, @Zip, @MainPhoneNumber, @PrimaryEmail)" 
        SelectCommand="SELECT slpl_patrons.UserID, slpl_patrons.FirstName, slpl_patrons.LastName, slpl_patrons.Birthdate, slpl_patrons.Address1, slpl_patrons.Address2, slpl_patrons.City, slpl_patrons.State, slpl_patrons.Zip, slpl_patrons.MainPhoneNumber, slpl_patrons.PrimaryEmail, aspnet_Users.UserName FROM slpl_patrons INNER JOIN aspnet_Users ON slpl_patrons.UserID = aspnet_Users.UserId WHERE (slpl_patrons.UserID = @UserID)" 
        UpdateCommand="UPDATE [slpl_patrons] SET [FirstName] = @FirstName, [LastName] = @LastName, [Birthdate] = @Birthdate, [Address1] = @Address1, [Address2] = @Address2, [City] = @City, [State] = @State, [Zip] = @Zip, [MainPhoneNumber] = @MainPhoneNumber, [PrimaryEmail] = @PrimaryEmail WHERE [UserID] = @UserID">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="object" />
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
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID"  />
        </SelectParameters>
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
    
    
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" SelectCommand="SELECT slpl_materials.MaterialID, slpl_materials.Title, slpl_materials.Author, slpl_materials.ISBN, slpl_materials.MaterialType, slpl_check_out_materials.DateDueBack FROM slpl_check_out_materials INNER JOIN slpl_materials ON slpl_check_out_materials.MaterialID = slpl_materials.MaterialID WHERE (slpl_check_out_materials.UserID = @UserID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p></p>
    
    
    <asp:Label ID="patron_deleted" CssClass="delete" runat="server"></asp:Label>
    
    


    <asp:FormView ID="FormView1" runat="server" CssClass="cssformview" DataSourceID="SqlDataSource2" DataKeyNames="UserID">
        <EditItemTemplate>

            <table>
                <tr>
            <td>User ID:</td>
            <td><asp:Label ID="UserIDLabel1" runat="server" Text='<%# Eval("UserID") %>' /></td>
                    <td></td>
            </tr>
                <tr>
              <td>User Name:</td>
            <td><asp:TextBox ID="UserNameTextBox" runat="server" Enabled="false" Text='<%# Bind("UserName") %>' /></td>
                    <td></td>
            </tr>
                <tr>
           <td>First Name:(*)</td>
            <td><asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="Fname_RequiredFieldValidator" runat="server" ControlToValidate="FirstNameTextBox" ErrorMessage="First Name Required"></asp:RequiredFieldValidator>
                    </td>
            </tr>
                <tr>
            <td>Last Name:(*)</td>
            <td><asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="LName_RequiredFieldValidator" runat="server" ControlToValidate="LastNameTextBox" ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>
                    </td>
            </tr>
                <tr>
            <td>Birthdate:(*)</td>
            <td><asp:TextBox ID="BirthdateTextBox" runat="server" Text='<%# Bind("Birthdate") %>' /></td>
                   
                    <td>
                        <asp:RequiredFieldValidator ID="DOB_RequiredFieldValidator" runat="server" ControlToValidate="BirthdateTextBox" ErrorMessage="Birthdate Required"></asp:RequiredFieldValidator>
                    </td>
           </tr>
                <tr>
            <td>Address 1:(*)</td>
           <td><asp:TextBox ID="Address1TextBox" runat="server" Text='<%# Bind("Address1") %>' /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="address_RequiredFieldValidator" runat="server" ControlToValidate="Address1TextBox" ErrorMessage="Please enter address"></asp:RequiredFieldValidator>
                    </td>
            </tr>
                <tr>
            <td>Address 2:</td>
            <td><asp:TextBox ID="Address2TextBox" runat="server" Text='<%# Bind("Address2") %>' /></td>
                    <td></td>
            </tr>
                <tr>
            <td>City:(*)</td>
            <td><asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="City_RequiredFieldValidator" runat="server" ControlToValidate="CityTextBox" ErrorMessage="Please enter City"></asp:RequiredFieldValidator>
                    </td>
           </tr>
                <tr>
            <td>State:</td>
            <td>
                 <asp:DropDownList ID="State_DropDown" runat="server" DataSourceID="ds_states" DataTextField="States" DataValueField="States" AppendDataBoundItems="True" selectedvalue='<%# Bind("State") %>' >
                     </asp:DropDownList>
            </td>
                    <td>
                       </td>
            </tr>
                <tr>
            <td>Zip:(*)</td>
            <td><asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="Zip_RequiredFieldValidator" runat="server" ControlToValidate="ZipTextBox" ErrorMessage="Please Enter Zip Code"></asp:RequiredFieldValidator>
                    </td>
           </tr>
                <tr>
            <td>Main Phone Number:</td>
            <td><asp:TextBox ID="MainPhoneNumberTextBox" runat="server" Text='<%# Bind("MainPhoneNumber") %>' /></td>
                    <td></td>
            </tr>
                <tr>
            <td>Primary Email:(*)</td>
            <td><asp:TextBox ID="PrimaryEmailTextBox" runat="server" Text='<%# Bind("PrimaryEmail") %>' /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="Email_RequiredFieldValidator" runat="server" ControlToValidate="PrimaryEmailTextBox" ErrorMessage="Please enter e-mail"></asp:RequiredFieldValidator>
                    </td>
           </tr>
                <tr>
          <td><asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" /></td>
            <td><asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td>
                    <td></td>                 
                </tr>

            </table>
             </EditItemTemplate>


        <InsertItemTemplate>
           </InsertItemTemplate>


        <ItemTemplate>
            <table>

            <tr>
                <td>User ID:</td>
                
            <td><asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' /></td>
            </tr>
                <tr>
             <td>User Name:</td>
            <td><asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' /></td>
            </tr>
                <tr>
            <td>First Name:</td>
            <td><asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' /></td>
            </tr>
                <tr>
            <td>Last Name:</td>
            <td><asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' /></td>
            </tr>
                <tr>
            <td>Birthdate:</td>
            <td><asp:Label ID="BirthdateLabel" runat="server" Text='<%# Bind("Birthdate") %>' /></td>
            </tr>
                <tr>
            <td>Address 1:</td>
            <td><asp:Label ID="Address1Label" runat="server" Text='<%# Bind("Address1") %>' /></td>
            </tr>
                <tr>
            <td>Address 2:</td>
            <td><asp:Label ID="Address2Label" runat="server" Text='<%# Bind("Address2") %>' /></td>
            </tr>
                <tr>
            <td>City:</td>
            <td><asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' /></td>
            </tr>
                <tr>
            <td>State:</td>
            <td><asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' /></td>
            </tr>
                <tr>
            <td>Zip:</td>
            <td><asp:Label ID="ZipLabel" runat="server" Text='<%# Bind("Zip") %>' /></td>
            </tr>
                <tr>
            <td>Main Phone Number:</td>
            <td><asp:Label ID="MainPhoneNumberLabel" runat="server" Text='<%# Bind("MainPhoneNumber") %>' /></td>
            </tr>
                <tr>
           <td> Primary Email:</td>
            <td><asp:Label ID="PrimaryEmailLabel" runat="server" Text='<%# Bind("PrimaryEmail") %>' /></td>
            </tr>
                <tr>
           <td><asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" /></td>
            <td><asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" OnClientClick="return confirm('Are you sure you want to delete?')" /></td>
                </tr>
            </table>
            </ItemTemplate>
            </asp:FormView>
           
            Materials Checked out:<br />

            <asp:GridView ID="GridView1" runat="server" CssClass="cssgridview" AutoGenerateColumns="False" DataKeyNames="MaterialID" DataSourceID="SqlDataSource3" Width="363px" AllowPaging="True" EmptyDataText="No items checked out">
                <Columns>
                    <asp:BoundField DataField="MaterialID" HeaderText="Material ID" InsertVisible="False" ReadOnly="True" SortExpression="MaterialID" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                    <asp:BoundField DataField="MaterialType" HeaderText="Material Type" SortExpression="MaterialType" />
                    <asp:BoundField DataField="DateDueBack" HeaderText="Date Due Back" SortExpression="DateDueBack" />
                </Columns>
            </asp:GridView>
        

     <asp:SqlDataSource ID="ds_states" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" SelectCommand="SELECT * FROM [slpl.states]"></asp:SqlDataSource>




    <%--<asp:FormView ID="FormView1" runat="server" DataKeyNames="UserID" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            <table cellpadding="5" id="table">
            <tr><td align="right">UserID:</td>
            <td align="left"><asp:Label ID="UserIDLabel1" runat="server" Text='<%# Eval("UserID") %>' /></td>
            </tr>
            <tr><td align="right">First Name:</td>
            <td align="left"><asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' /></td>
           </tr>
            <tr><td align="right">Last Name:</td>
            <td align="left"><asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' /></td>
           </tr>
            <tr><td align="right">Birthdate:</td>
            <td align="left"><asp:TextBox ID="BirthdateTextBox" runat="server" Text='<%# Bind("Birthdate") %>' /></td>
            </tr>
            <tr><td align="right">Address1:</td>
            <td align="left"><asp:TextBox ID="Address1TextBox" runat="server" Text='<%# Bind("Address1") %>' /></td>
            </tr>
            <tr><td align="right">Address2:</td>
            <td align="left"><asp:TextBox ID="Address2TextBox" runat="server" Text='<%# Bind("Address2") %>' /></td>
            </tr>
            <tr><td align="right">City:</td>
            <td align="left"><asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' /></td>
           </tr>
            <tr><td align="right">State:</td>
            <td align="left"><asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' /></td>
            </tr>
            <tr><td align="right">Zip:</td>
            <td align="left"><asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' /></td>
           </tr>
            <tr><td align="right">Main Phone Number:</td>
            <td align="left"><asp:TextBox ID="MainPhoneNumberTextBox" runat="server" Text='<%# Bind("MainPhoneNumber") %>' /></td>
            </tr>
            <tr><td align="right">Primary Email:</td>
            <td align="left"><asp:TextBox ID="PrimaryEmailTextBox" runat="server" Text='<%# Bind("PrimaryEmail") %>' /></td>
            </tr>
            

                <tr><td></td>
            <td align="left">
                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                
        
                </td></tr>
                </table>
                
                </EditItemTemplate>


        <InsertItemTemplate>
              </InsertItemTemplate>


        <ItemTemplate>
            <table cellpadding="5" id="table">
            <tr><td align="right">UserID:</td>
            <td><asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' /></td>
            </tr>
            <tr><td align="right">First Name:</td>
            <td><asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' /></td>
            </tr>
            <tr><td align="right">Last Name:</td>
            <td><asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' /></td>
            </tr>
            <tr><td align="right">Birthdate:</td>
            <td><asp:Label ID="BirthdateLabel" runat="server" Text='<%# Bind("Birthdate") %>' /></td>
            </tr>
            <tr><td align="right">Address1:</td>
            <td><asp:Label ID="Address1Label" runat="server" Text='<%# Bind("Address1") %>' /></td>
           </tr>
            <tr><td align="right">Address2:</td>
            <td><asp:Label ID="Address2Label" runat="server" Text='<%# Bind("Address2") %>' /></td>
            </tr>
            <tr><td align="right">City:</td>
            <td><asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' /></td>
           </tr>
            <tr><td align="right">State:</td>
            <td><asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' /></td>
           </tr>
            <tr><td align="right">Zip:</td>
            <td><asp:Label ID="ZipLabel" runat="server" Text='<%# Bind("Zip") %>' /></td>
           </tr>
            <tr><td align="right">Main Phone Number:</td>
            <td><asp:Label ID="MainPhoneNumberLabel" runat="server" Text='<%# Bind("MainPhoneNumber") %>' /></td>
           </tr>
            <tr><td align="right">Primary Email:</td>
            <td><asp:Label ID="PrimaryEmailLabel" runat="server" Text='<%# Bind("PrimaryEmail") %>' /></td>
           </tr>
            <tr><td align="right">User Name:</td>
            <td><asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' /></td>
           </tr>
            <tr><td align="right">Role Name:</td>
            <td><asp:Label ID="RoleNameLabel" runat="server" Text='<%# Bind("RoleName") %>' /></td>
          </tr>
                <tr>

           <td></td> <td>
               <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
               <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
              
       </td></tr>
                    </table>
                
                 </ItemTemplate>
    </asp:FormView>--%>


</asp:Content>

