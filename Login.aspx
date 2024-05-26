<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="sv1761.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceTourReader %>" ProviderName="<%$ ConnectionStrings:SpaceTourReader.ProviderName %>" SelectCommand="SELECT * FROM [CUSTOMER] WHERE (([CUS_LOGIN] = @CUS_LOGIN) AND ([CUS_PWD] = @CUS_PWD))">
                <SelectParameters>
                    <asp:Parameter Name="CUS_LOGIN" Type="String" />
                    <asp:Parameter Name="CUS_PWD" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />

            <table class="auto-style2">
                <tr>
                    <td>Username</td>
                    <td>
                        <asp:TextBox ID="txtUID" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="txtPWD" runat="server" TextMode="Password" Height="21px"></asp:TextBox>
                    </td>
                </tr>
            </table>

        </div>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CreateAcct.aspx">New User? Create account here</asp:HyperLink>
            <br />
            <asp:Label ID="lblError" runat="server"></asp:Label>          
        </p>
        <asp:Button ID="btnlogin" runat="server" Text="LOGIN" />

</asp:Content>
