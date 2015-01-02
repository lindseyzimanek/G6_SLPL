<%@ Page Title="Photo Upload" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="photoupload.aspx.vb" Inherits="librarian_photoupload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p></p>
    Material ISBN: <asp:TextBox ID="ISBN" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="ISBNRequiredFieldValidator" runat="server" ErrorMessage="Please enter ISBN" ControlToValidate="ISBN"></asp:RequiredFieldValidator>
    <p></p>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br /><br />
    <asp:Button ID="upload_button" runat="server" Text="Upload Image" />
    <p></p>
    <asp:Label ID="resultslabel" runat="server" CssClass="delete" Text=""></asp:Label>

</asp:Content>

