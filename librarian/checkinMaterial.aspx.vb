Imports System.Data.SqlClient
Partial Class librarian_checkinMaterial
    Inherits System.Web.UI.Page

    Protected Sub btn_checkIn_Click(sender As Object, e As EventArgs) Handles btn_checkIn.Click
        errorlabel.Text = String.Empty

        Try


            Dim strMaterialID As String = tb_checkInMaterial.Text

            Dim sqlConn As New SqlConnection(ConfigurationManager.ConnectionStrings("msci3300_g6").ConnectionString)

            Dim sqlAdp As New SqlDataAdapter
            Dim sqlCmd As New SqlCommand



            sqlCmd.Connection = sqlConn
            sqlCmd.CommandText = "sp_slpl_MaterialCheckIn"
            sqlCmd.CommandType = Data.CommandType.StoredProcedure

            sqlCmd.Parameters.Add(New SqlParameter("@materialID", strMaterialID))

            sqlConn.Open()
            sqlCmd.ExecuteNonQuery()
            sqlConn.Close()

            Response.Redirect("~/librarian/viewAllCheckedOut.aspx")

        Catch ex As Exception
            errorlabel.Text = "Invalid MaterialID. Please try again"

        End Try


    End Sub
End Class
