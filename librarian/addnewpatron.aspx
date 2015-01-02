<%@ Page Title="Add New Patron" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="addnewpatron.aspx.vb" Inherits="librarian_addnewpatron" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">Add New Patron
    <%--<style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>--%>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />

    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" LoginCreatedUser="false" >

        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
            </asp:CreateUserWizardStep>
            <asp:WizardStep ID="UserProfile" runat="server" StepType="Step" Title="User Profile Settings">
                
            <table>
<tr>
	<td>First Name:</td>
	<td>
    <asp:TextBox ID="FirstNameTextBox" runat="server" />
	</td>
    </tr>
	<tr>
    <td>Last Name:</td><td>
    <asp:TextBox ID="LastNameTextBox" runat="server" />
    </td>
    </tr><tr>
    <td>Birthdate:</td><td>
    <asp:TextBox ID="BirthdateTextBox" runat="server" />
    </td>
    </tr><tr>
    <td>Address 1:</td><td>
    <asp:TextBox ID="Address1TextBox" runat="server" />
    </td>
    </tr><tr>
    <td>Address 2:</td><td>
    <asp:TextBox ID="Address2TextBox" runat="server" />
    </td>
    </tr><tr>
    <td class="auto-style1">City:</td><td class="auto-style1">
    <asp:TextBox ID="CityTextBox" runat="server" />
    </td>
    </tr><tr>
    <td>State:</td><td>
        <asp:DropDownList ID="State_DropDown" runat="server" DataSourceID="ds_states" DataTextField="States" DataValueField="States" AppendDataBoundItems="True" >

</asp:DropDownList>
    </td>
    </tr><tr>
    <td>Zip:</td><td>
    <asp:TextBox ID="ZipTextBox" runat="server" />
    </td>
    </tr><tr>
    <td>Main Phone Number:</td><td>
    <asp:TextBox ID="MainPhoneNumberTextBox" runat="server" />
    </td>
    </tr><tr>
    <td>Primary Email:</td><td>
    <asp:TextBox ID="PrimaryEmailTextBox" runat="server" />
    </td>
    </tr>
	</table>

                <asp:SqlDataSource ID="ds_states" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" SelectCommand="SELECT * FROM [slpl.states]"></asp:SqlDataSource>




            </asp:WizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="center" colspan="2">Complete</td>
                        </tr>
                        <tr>
                            <td>Your account has been successfully created.</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" OnClick="ContinueButton_Click" Text="Continue" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>


</asp:Content>

