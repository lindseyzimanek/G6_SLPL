Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_PreInit(sender As Object, e As EventArgs) Handles Me.PreInit
        If Request.Browser.IsMobileDevice Then
            Response.Redirect("mobile.aspx")
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim materialCount As Integer
        Dim sqlConn As New SqlConnection(ConfigurationManager.ConnectionStrings("msci3300_g6").ConnectionString)
        Dim sqlCmd As New SqlCommand
        sqlCmd.Connection = sqlConn
        sqlCmd.CommandText = "SELECT COUNT(MaterialID) FROM [slpl_materials] "

        sqlConn.Open()
        materialCount = sqlCmd.ExecuteScalar()
        sqlConn.Close()
        materialCountLabel.Text = materialCount.ToString
        materialCountLabel.Text = materialCount.ToString

    End Sub

End Class
