Imports System.Data.SqlClient

Partial Class librarian_checkoutMaterial
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        tb_userName.Focus()
    End Sub

    Protected Sub btn_checkOut_Click(sender As Object, e As EventArgs) Handles btn_checkOut.Click

        errorlabel.Text = String.Empty

        Try


            Dim strMaterialID As String = tb_materialID.Text
            Dim strUserName As String = tb_userName.Text
            Dim CheckOutDate As DateTime = DateTime.Now
            Dim DateDueBack As DateTime = DateAdd("d", 30, Today)

            Dim sqlConn As New SqlConnection(ConfigurationManager.ConnectionStrings("msci3300_g6").ConnectionString)

            Dim sqlAdp As New SqlDataAdapter
            Dim sqlCmd As New SqlCommand



            sqlCmd.Connection = sqlConn
            sqlCmd.CommandText = "sp_slpl_CheckOutMaterial"
            sqlCmd.CommandType = Data.CommandType.StoredProcedure
            sqlCmd.Parameters.Add(New SqlParameter("@UserName", strUserName))
            sqlCmd.Parameters.Add(New SqlParameter("@MaterialID", strMaterialID))
            sqlCmd.Parameters.Add(New SqlParameter("@CheckOutDate", CheckOutDate))
            sqlCmd.Parameters.Add(New SqlParameter("@DateDueBack", DateDueBack))
            sqlConn.Open()
            sqlCmd.ExecuteNonQuery()
            sqlConn.Close()

            Response.Redirect("~/librarian/viewAllCheckedOut.aspx")

        Catch ex As Exception

            errorlabel.Text = "Invalid User or MaterialID. Please try again"


        End Try



    End Sub

End Class
