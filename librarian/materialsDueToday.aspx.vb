
Partial Class librarian_materialsDueToday
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        'declare variable
        Dim MaterialsDueToday As String

        'set variable equal to SQL statement to perform search
        MaterialsDueToday = "SELECT * FROM slpl_check_out_materials WHERE DateDueBack=CONVERT(datetime,CONVERT(varchar(10),GetDate(),112))"

        'apply variable (SQL Statement) to data source
        SqlDataSource1.SelectCommand = MaterialsDueToday

    End Sub
End Class
