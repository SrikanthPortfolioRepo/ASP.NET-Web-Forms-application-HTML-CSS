<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerInfoUpdate.aspx.cs" Inherits="sv1761.CustomerInfoUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <div class="avatar">
        </div>
        <asp:Label ID="CustomerName_sv1761" runat="server" CssClass="user-name">Customer Name</asp:Label>
        <div class="welcome-message">Welcome to your profile page!</div>
        <div>
            <table>
                <tr>
                    <td>Username:</td>
                    <td>
                        <asp:Label ID="user_name_sv1761" runat="server" CssClass="user-name">Customer Name</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="sv1761_pwd1" TextMode="Password" runat="server" AutoCompleteType="Enabled" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="pwd1Validator" runat="server" ControlToValidate="sv1761_pwd1" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Confirm Password:</td>
                    <td>
                        <asp:TextBox ID="sv1761_pwd2" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="pwd2Validator" runat="server" ControlToValidate="sv1761_pwd2" ErrorMessage="Confirm Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="comparePwdValidator" runat="server" ControlToValidate="sv1761_pwd2" ControlToCompare="sv1761_pwd1" ErrorMessage="Passwords must match" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>

                <tr>
                    <td>First Name:</td>
                    <td>
                        <asp:TextBox ID="f_name_sv1761" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="f_nameValidator" runat="server" ControlToValidate="f_name_sv1761" ErrorMessage="First Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Last Name:</td>
                    <td>
                        <asp:TextBox ID="l_name_sv1761" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="l_nameValidator" runat="server" ControlToValidate="l_name_sv1761" ErrorMessage="Last Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="email_sv1761" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="email_nameValidator" runat="server" ControlToValidate="email_sv1761" ErrorMessage="Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="email_nameFormatValidator" runat="server" ControlToValidate="email_sv1761" ErrorMessage="Enter a valid email address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Year of Birth:</td>
                    <td>
                        <asp:TextBox ID="yob_sv1761" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatoryob" runat="server" ControlToValidate="yob_sv1761" ForeColor="Red"
                            ErrorMessage="Year is required." ValidationGroup="RegistrationValidation" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnUpdate" CssClass="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnLogout" CssClass="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CausesValidation="False" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:Button ID="btnBackToHomePage" CssClass="btnBackToHomePage" runat="server" Text="Back to Home Page" OnClick="BackToHomePage_Click" CausesValidation="False" />
       
      
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceTourReader %>" SelectCommand="SELECT [CUS_FNAME], [CUS_LNAME], [CUS_EMAIL], [CUS_YOB], [CUS_PWD] FROM [CUSTOMER] WHERE ([CUS_LOGIN] = @CUS_LOGIN)">
              <SelectParameters>
                  <asp:Parameter Name="CUS_LOGIN" Type="String" />
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceTourUpdate %>" DeleteCommand="DELETE FROM [CUSTOMER] WHERE [CUS_NUM] = @CUS_NUM" InsertCommand="INSERT INTO [CUSTOMER] ([CUS_LOGIN], [CUS_PWD], [CUS_FNAME], [CUS_LNAME], [CUS_EMAIL], [CUS_YOB]) VALUES (@CUS_LOGIN, @CUS_PWD, @CUS_FNAME, @CUS_LNAME, @CUS_EMAIL, @CUS_YOB)" SelectCommand="SELECT * FROM [CUSTOMER]" UpdateCommand="UPDATE [CUSTOMER] SET [CUS_LOGIN] = @CUS_LOGIN, [CUS_PWD] = @CUS_PWD, [CUS_FNAME] = @CUS_FNAME, [CUS_LNAME] = @CUS_LNAME, [CUS_EMAIL] = @CUS_EMAIL, [CUS_YOB] = @CUS_YOB WHERE [CUS_NUM] = @CUS_NUM">
              <DeleteParameters>
                  <asp:Parameter Name="CUS_NUM" />
              </DeleteParameters>
              <InsertParameters>
                  <asp:Parameter Name="CUS_LOGIN" />
                  <asp:Parameter Name="CUS_PWD" />
                  <asp:Parameter Name="CUS_FNAME" />
                  <asp:Parameter Name="CUS_LNAME" />
                  <asp:Parameter Name="CUS_EMAIL" />
                  <asp:Parameter Name="CUS_YOB" />
              </InsertParameters>
              <UpdateParameters>
                  <asp:Parameter Name="CUS_LOGIN" />
                  <asp:Parameter Name="CUS_PWD" />
                  <asp:Parameter Name="CUS_FNAME" />
                  <asp:Parameter Name="CUS_LNAME" />
                  <asp:Parameter Name="CUS_EMAIL" />
                  <asp:Parameter Name="CUS_YOB" />
                  <asp:Parameter Name="CUS_NUM" />
              </UpdateParameters>
          </asp:SqlDataSource>
       
      
    </div>
</asp:Content>