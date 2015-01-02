<%@ Page Title="Users" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="users.aspx.vb" Inherits="admin_site_mgr_users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Manage Users
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



        <div style="clear:both;"></div>

   
<asp:GridView runat="server" ID="Users" AutoGenerateColumns="false" CssClass="cssGridView" AlternatingRowStyle-CssClass="odd" GridLines="none" >
<Columns>
	<asp:TemplateField>
		<HeaderTemplate>User Name</HeaderTemplate>
		<ItemTemplate>
		<a href="edit_user.aspx?username=<%# Eval("UserName") %>"><%# Eval("UserName") %></a>
		</ItemTemplate>
	</asp:TemplateField>
	<asp:BoundField DataField="email" HeaderText="Email" />
	<asp:BoundField DataField="comment" HeaderText="Comments" />
	<asp:BoundField DataField="creationdate" HeaderText="Creation Date" />
	<asp:BoundField DataField="lastlogindate" HeaderText="Last Login Date" />
	<asp:BoundField DataField="lastactivitydate" HeaderText="Last Activity Date" />
	<asp:BoundField DataField="isapproved" HeaderText="Is Active" />
	<asp:BoundField DataField="isonline" HeaderText="Is Online" />
	<asp:BoundField DataField="islockedout" HeaderText="Is Locked Out" />
</Columns>
</asp:GridView>
  



</asp:Content>

