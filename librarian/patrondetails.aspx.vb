
Partial Class librarian_patrondetails
    Inherits System.Web.UI.Page


   


    Protected Sub DeleteButton_Click(sender As Object, e As EventArgs)
        Dim selUser As Label = CType(FormView1.FindControl("UserNameLabel"), Label)

        If selUser IsNot Nothing Then

            Dim delUser As String = selUser.Text

            Membership.DeleteUser(delUser)

            patron_deleted.Text = delUser & " has been deleted from the database."

            FormView1.Visible = False

            Response.AddHeader("REFRESH", "3;URL=viewallpatrons.aspx")

        End If
    End Sub
End Class
