Imports System.Data.SqlClient

Partial Class librarian_newresource
    Inherits System.Web.UI.Page


    
    Protected Sub fv_newresource_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles fv_newresource.ItemInserted
        Dim itemadded As String = e.Values("Title").ToString()

        lbl_status.Text = itemadded & " has been added to the database."



        Response.AddHeader("REFRESH", "3;URL=newresource.aspx")

    End Sub


   
End Class
