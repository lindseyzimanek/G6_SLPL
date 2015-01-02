
Partial Class librarian_resource_details
    Inherits System.Web.UI.Page

    Protected Sub fv_resourcedetails_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles fv_resourcedetails.ItemDeleted
        Dim itemdeleted As String = e.Values("Title").ToString()

        lbl_deleted.Text = itemdeleted & " has been deleted from the database."

        Response.AddHeader("REFRESH", "3;URL=viewresources.aspx")
    End Sub




    Protected Sub fv_resourcedetails_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles fv_resourcedetails.ItemUpdated
        Response.AddHeader("REFRESH", "3;URL=viewresources.aspx")
    End Sub

    


    Protected Sub fv_resourcedetails_PageIndexChanging(sender As Object, e As FormViewPageEventArgs) Handles fv_resourcedetails.PageIndexChanging

    End Sub
End Class
