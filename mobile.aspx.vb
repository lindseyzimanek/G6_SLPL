
Partial Class mobile
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        tbMaterialSearch.Focus()

    End Sub

    Protected Sub btnMaterialSearch_Click(sender As Object, e As EventArgs) Handles btnMaterialSearch.Click

        Dim searchterm As String

        searchterm = "Select * From slpl_materials where (Title Like '%" + tbMaterialSearch.Text.ToUpper.ToString() + "%') or (Author Like '%" + tbMaterialSearch.Text.ToUpper.ToString() + "%') or (Description Like '%" + tbMaterialSearch.Text.ToUpper.ToString() + "%') or (ISBN Like '%" + tbMaterialSearch.Text.ToUpper.ToString() + "%') or (MaterialID Like '%" + tbMaterialSearch.Text.ToUpper.ToString() + "%')"

        SqlDataSource1.SelectCommand = searchterm

    End Sub

End Class
