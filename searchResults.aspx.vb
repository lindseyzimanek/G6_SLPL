
Partial Class Library_searchResults
    Inherits System.Web.UI.Page

    Protected Sub Page_PreInit(sender As Object, e As EventArgs) Handles Me.PreInit
        If Request.Browser.IsMobileDevice Then
            Response.Redirect("mobile.aspx")
        End If
    End Sub

   

End Class
