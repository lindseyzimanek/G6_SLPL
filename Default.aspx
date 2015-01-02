<%@ Page Title="Home" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p></p>
    
    <h2>Welcome to the SLPL Home Page!</h2>
    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2973.955594786004!2d-91.498249!3d41.807717000000004!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x87e4671426b0da03%3A0x5125ba5b8ebf2289!2sSolon+Public+Library!5e0!3m2!1sen!2sus!4v1416962234678" width="400" height="300" frameborder="0" style="border:0"></iframe>

    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:msci3300_g6 %>" SelectCommand="SELECT * FROM [slpl_materials]"></asp:SqlDataSource>
    <br />

    Total number of materials in circulation: <asp:label runat="server" ID="materialCountLabel"></asp:label>
</asp:Content>

