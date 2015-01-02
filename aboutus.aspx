<%@ Page Title="About Us" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="aboutus.aspx.vb" Inherits="aboutus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">About Us
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p></p>
    <asp:Image ID="outside" runat="server" ImageUrl="~/pics/outside.jpg" ToolTip="South Liberty Public Library" AlternateText="South Liberty Public Library" />

    <div id ="libHours">
        <table>
            <tr>
                <td style="text-align:right;">
                Library Hours
                 </td>
                <td>

                </td>
            </tr>
            <tr>
                <td style="text-align:right;">
                    Mon-Thurs:
                </td>
                <td style="text-align:left;">
                    10 a.m. - 9 p.m.
                </td>
            </tr>
             <tr>
                <td style="text-align:right;">
                    Friday:
                </td>
                <td style="text-align:left;">
                    10 a.m. - 8 p.m.
                </td>
            </tr>
             <tr>
                <td style="text-align:right;">
                    Saturday:
                </td>
                <td style="text-align:left;">
                    10 a.m. - 6 p.m.
                </td>
            </tr>
             <tr>
                <td style="text-align:right;">
                    Sunday:
                </td>
                <td style="text-align:left;">
                    12 p.m. - 5 p.m.
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

