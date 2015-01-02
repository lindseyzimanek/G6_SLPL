
Partial Class librarian_viewallpatrons
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        tbPatronSearch.Focus()

    End Sub

    Protected Sub btnPatronSearch_Click(sender As Object, e As EventArgs) Handles btnPatronSearch.Click

        Dim searchterm As String

        searchterm = "Select * From slpl_patrons where (FirstName Like '%" + tbPatronSearch.Text.ToUpper.ToString() + "%') or (LastName Like '%" + tbPatronSearch.Text.ToUpper.ToString() + "%') or (MainPhoneNumber Like '%" + tbPatronSearch.Text.ToUpper.ToString() + "%') or (PrimaryEmail Like '%" + tbPatronSearch.Text.ToUpper.ToString() + "%')"

        SqlDataSource1.SelectCommand = searchterm

    End Sub

End Class
