Imports System.Data.SqlClient

Partial Class librarian_addnewpatron
    Inherits System.Web.UI.Page

    Protected Sub ContinueButton_Click(sender As Object, e As EventArgs)
        Response.Redirect("viewallpatrons.aspx")

    End Sub

    Protected Sub State_DropDown_DataBound(sender As Object, e As EventArgs) Handles State_DropDown.DataBound
        State_DropDown.SelectedIndex = 14
    End Sub

    Protected Sub CreateUserWizard1_ActiveStepChanged(sender As Object, e As EventArgs) Handles CreateUserWizard1.ActiveStepChanged


        If CreateUserWizard1.ActiveStep.Title = "Complete" Then

            Dim UserSettings As WizardStep = CType(CreateUserWizard1.FindControl("UserProfile"), WizardStep)

            'Get Textbox, DropDown Controls
            Dim FirstName As TextBox = CType(UserSettings.FindControl("FirstNameTextBox"), TextBox)
            Dim LastName As TextBox = CType(UserSettings.FindControl("LastNameTextBox"), TextBox)
            Dim Birthdate As TextBox = CType(UserSettings.FindControl("BirthdateTextBox"), TextBox)
            Dim Address1 As TextBox = CType(UserSettings.FindControl("Address1TextBox"), TextBox)
            Dim Address2 As TextBox = CType(UserSettings.FindControl("Address2TextBox"), TextBox)
            Dim City As TextBox = CType(UserSettings.FindControl("CityTextBox"), TextBox)
            Dim state As String = State_DropDown.SelectedItem.Text

            Dim zip As TextBox = CType(UserSettings.FindControl("ZipTextBox"), TextBox)
            Dim phone As TextBox = CType(UserSettings.FindControl("MainPhoneNumberTextBox"), TextBox)
            Dim email As TextBox = CType(UserSettings.FindControl("PrimaryEmailTextBox"), TextBox)

            ' Get userID of just created user
            Dim newuser As MembershipUser = Membership.GetUser(CreateUserWizard1.UserName)
            Dim newuserid As Guid = CType(newuser.ProviderUserKey, Guid)

            ' Add new user to patron role
            Roles.AddUserToRole(newuser.UserName, "slpl_patron")

            ' Inset new record into patrons
            Dim connectionstring As String = ConfigurationManager.ConnectionStrings("msci3300_g6").ConnectionString
            Dim updateSql As String = "INSERT INTO [slpl_patrons] ([UserID], [FirstName], [LastName], [Birthdate], [Address1], [Address2], [City], [State], [Zip], [MainPhoneNumber], [PrimaryEmail]) VALUES ( @UserID, @FirstName, @LastName, @Birthdate, @Address1, @Address2, @City, @State, @Zip, @MainPhoneNumber, @PrimaryEmail )"

            Using myConnection As New SqlConnection(connectionstring)
                myConnection.Open()
                Dim myCommand As New SqlCommand(updateSql, myConnection)
                myCommand.Parameters.Add(New SqlParameter("@State", state))
                myCommand.Parameters.AddWithValue("@FirstName", FirstName.Text.Trim)
                myCommand.Parameters.AddWithValue("@LastName", LastName.Text.Trim)
                myCommand.Parameters.AddWithValue("@Birthdate", Birthdate.Text.Trim)
                myCommand.Parameters.AddWithValue("@Address1", Address1.Text.Trim)
                myCommand.Parameters.AddWithValue("@Address2", Address2.Text.Trim)
                myCommand.Parameters.AddWithValue("@City", City.Text.Trim)
                myCommand.Parameters.AddWithValue("@Zip", zip.Text.Trim)
                myCommand.Parameters.AddWithValue("@MainPhoneNumber", phone.Text.Trim)
                myCommand.Parameters.AddWithValue("@PrimaryEmail", email.Text.Trim)
                myCommand.Parameters.AddWithValue("@UserID", newuserid)
                myCommand.ExecuteNonQuery()
                myConnection.Close()

            End Using

        End If



    End Sub
End Class
