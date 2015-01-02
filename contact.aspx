<%@ Page Title="Contact Us" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="contact.aspx.vb" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">Contact Information
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    </p>

    South Liberty Public Library<br />
    123 Main Street<br />
    South Liberty, IA 52331
    <p></p>
    
    Phone: 319-555-1234<br />
    Fax: 319-555-7789
    <p></p>

    E-mail us at: info@slpl.org<br />
    Or use our contact form below:
    <p></p>

    <!-- Check to see if you are in postback.  If not, display the contact form. -->
        <% If Not IsPostBack Then%>
    
    
        Your email address: (i.e.&nbsp; jsmith@gmail.com)<br />
        <asp:TextBox ID="senderAddress" runat="server" Width="259px"></asp:TextBox><asp:RequiredFieldValidator ID="senderRequiredFieldValidator" runat="server" ErrorMessage=" Please enter valid email address" ControlToValidate="senderAddress"></asp:RequiredFieldValidator>
        <br />
        <br />
       
         Enter your message below: <br />
        <!-- to make your box bigger add rows, columns, and textmode -->
        <asp:TextBox ID="senderMessage" runat="server" Rows="20" Columns="30" TextMode="MultiLine" Height="200px" Width="350px"></asp:TextBox>
        
        <br />
        <br />
        <asp:Button ID="sendMail" runat="server" Text="Send" />

       
        <!-- If you are in postback, display the confirmation label. -->
        <%Else%>

        <div class="deletemessage">
        <asp:Label ID="confirmSent" runat="server" Text=""></asp:Label>
            </div>

        <!-- End your 'If' statement. -->
        <%End If%>



</asp:Content>

