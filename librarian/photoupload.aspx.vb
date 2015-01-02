
Partial Class librarian_photoupload
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles upload_button.Click
        Dim filepath As String = Server.MapPath("~\pics")
        Dim photoName As String = ISBN.Text

        If FileUpload1.HasFile Then
            Try
                FileUpload1.SaveAs(filepath & "\" & photoName & ".jpg")

                resultslabel.Text = "Item uploaded"
            Catch ex As Exception
                resultslabel.Text = "error"
            End Try
        Else
            resultslabel.Text = "No file selected."
        End If

    End Sub
End Class
