<%@ Page Title="Roles" Language="VB" MasterPageFile="~/admin.master" AutoEventWireup="false" CodeFile="roles.aspx.vb" Inherits="admin_site_mgr_roleManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Manage Roles
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


       
        <asp:GridView runat="server" ID="gv_userRoles" AutoGenerateColumns="false" 
            CssClass="cssGridView" AlternatingRowStyle-CssClass="odd" GridLines="none" >
	<Columns>
		<asp:TemplateField>
			<HeaderTemplate>Role Name</HeaderTemplate>
			<ItemTemplate>
				<%# Eval("Role Name") %>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField>
			<HeaderTemplate>User Count</HeaderTemplate>
			<ItemTemplate>
				<%# Eval("User Count") %>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField>
			<HeaderTemplate>Delete Role</HeaderTemplate>
			<ItemTemplate>
				<asp:Button ID="Button1" runat="server" OnCommand="DeleteRole" CommandName="DeleteRole" CommandArgument='<%# Eval("Role Name") %>' Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this role?')" />
            </ItemTemplate>
		</asp:TemplateField>
	</Columns>
</asp:GridView>


        <br />
        <asp:Label ID="lbl_roleMgr" runat="server" Text=""></asp:Label>
        <br />

        <div class="roleDiv">
        <asp:TextBox ID="tb_newRole" runat="server"></asp:TextBox> <asp:Button ID="btn_newRole" runat="server" Text="Add A New Role" />
        </div>
   


</asp:Content>

