
Partial Class login_login
    Inherits System.Web.UI.Page

    Protected Sub Login1_LoggedIn(sender As Object, e As EventArgs) Handles Login1.LoggedIn
        If Roles.IsUserInRole(Login1.UserName, "slpl_admin") = True Then
            Response.Redirect("~/superLibrarian/default.aspx")

        ElseIf Roles.IsUserInRole(Login1.UserName, "slpl_librarian") = True Then
            Response.Redirect("~/librarian/default.aspx")

        ElseIf Roles.IsUserInRole(Login1.UserName, "slpl_patron") = True Then
            Response.Redirect("~/patron/default.aspx")





        Else
            Response.Redirect("~/default.aspx")
        End If

    End Sub

End Class
