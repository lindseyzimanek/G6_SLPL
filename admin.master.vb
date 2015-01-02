
Partial Class library
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        currentTimeLabel.Text = DateTime.Now.ToString("hh:mm dddd, dd MMMM yyyy")
        lbl_copy.Text = DateTime.Now.Year

    End Sub

    Protected Sub searchBtn_Click(sender As Object, e As EventArgs) Handles searchBtn.Click

        Response.Redirect("~/searchResults.aspx?searchquery=" + Server.UrlEncode(searchTB.Text))

    End Sub





End Class

