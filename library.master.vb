
Partial Class library
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        'currentTimeLabel.Text = DateTime.Now.ToString("hh:mm dddd, dd MMMM yyyy")
        currentTimeLabel.Text = DateTime.Now.ToString("dddd, MMMM dd yyyy")

        lbl_copy.Text = DateTime.Now.Year

        If Not Roles.IsUserInRole("slpl_admin") Then
            Dim menuitems As MenuItemCollection = libraryMenu.Items
            Dim adminItem As New MenuItem
            For Each MenuItem As MenuItem In menuitems
                If MenuItem.Text = "Super Librarian" Then
                    adminItem = MenuItem
                End If
            Next
            menuitems.Remove(adminItem)
        End If

        If Not Roles.IsUserInRole("slpl_librarian") Then
            Dim menuitems As MenuItemCollection = libraryMenu.Items
            Dim adminItem As New MenuItem
            For Each MenuItem As MenuItem In menuitems
                If MenuItem.Text = "Librarian" Then
                    adminItem = MenuItem
                End If
            Next
            menuitems.Remove(adminItem)
        End If
    End Sub

    Protected Sub searchBtn_Click(sender As Object, e As EventArgs) Handles searchBtn.Click

        Response.Redirect("~/searchResults.aspx?searchquery=" + Server.UrlEncode(searchTB.Text))

    End Sub





End Class

