<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CreateAcct.aspx.cs" Inherits="sv1761.CreateAcct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div>
            Account Creation</div>
        <br />
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">UserName</td>
                <td class="auto-style2">
                    <asp:TextBox ID="UName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqField" runat="server" ControlToValidate="UName" ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Password</td>
                <td>
                    <asp:TextBox ID="pwd" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pwd" ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Confim Password</td>
                <td>
                    <asp:TextBox ID="cpwd" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CmpValid" runat="server" ControlToCompare="cpwd" ControlToValidate="pwd" ErrorMessage="CompareValidator" ForeColor="#FF3300">Password Must match</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cpwd" ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">First Name</td>
                <td>
                    <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FirstName" ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Last Name</td>
                <td>
                    <asp:TextBox ID="LastName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="LastName" ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Email</td>
                <td>
                    <asp:TextBox ID="email" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="REValid" runat="server" ControlToValidate="Email" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#FF3300">Must be Email</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Email" ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Year Of Birth</td>
                <td>
                    <asp:TextBox ID="yob" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="Year" runat="server" ControlToValidate="yob" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d{4}" ForeColor="#FF3300">Must be four digit year</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="yob" ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300">Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="Create" runat="server" OnClick="Create_Click" Text="Create Acoount" Width="102px" />
                </td>
            </tr>
        </table>
<asp:SqlDataSource ID="dbCreate" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceTourWriter %>" DeleteCommand="DELETE FROM [CUSTOMER] WHERE [CUS_NUM] = @CUS_NUM" InsertCommand="INSERT INTO [CUSTOMER] ([CUS_LOGIN], [CUS_PWD], [CUS_FNAME], [CUS_LNAME], [CUS_EMAIL], [CUS_YOB]) VALUES (@CUS_LOGIN, @CUS_PWD, @CUS_FNAME, @CUS_LNAME, @CUS_EMAIL, @CUS_YOB)" SelectCommand="SELECT * FROM [CUSTOMER]" UpdateCommand="UPDATE [CUSTOMER] SET [CUS_LOGIN] = @CUS_LOGIN, [CUS_PWD] = @CUS_PWD, [CUS_FNAME] = @CUS_FNAME, [CUS_LNAME] = @CUS_LNAME, [CUS_EMAIL] = @CUS_EMAIL, [CUS_YOB] = @CUS_YOB WHERE [CUS_NUM] = @CUS_NUM">
    <DeleteParameters>
        <asp:Parameter Name="CUS_NUM" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="CUS_LOGIN" Type="String" />
        <asp:Parameter Name="CUS_PWD" Type="String" />
        <asp:Parameter Name="CUS_FNAME" Type="String" />
        <asp:Parameter Name="CUS_LNAME" Type="String" />
        <asp:Parameter Name="CUS_EMAIL" Type="String" />
        <asp:Parameter Name="CUS_YOB" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="CUS_LOGIN" Type="String" />
        <asp:Parameter Name="CUS_PWD" Type="String" />
        <asp:Parameter Name="CUS_FNAME" Type="String" />
        <asp:Parameter Name="CUS_LNAME" Type="String" />
        <asp:Parameter Name="CUS_EMAIL" Type="String" />
        <asp:Parameter Name="CUS_YOB" Type="Int32" />
        <asp:Parameter Name="CUS_NUM" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
