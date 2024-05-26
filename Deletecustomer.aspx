<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Deletecustomer.aspx.cs" Inherits="sv1761.Deletecustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>We are sorry to see you go! Please enter the information below to remove your account</h3>
<table style="width:100%;">
<tr>
<td class="auto-style2">Enter your Username</td>
<td class="auto-style1">
<asp:TextBox ID="user_value" runat="server" Height="31px" Width="243px"></asp:TextBox>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td class="auto-style2">Confirm Your Username</td>
<td class="auto-style1">
<asp:TextBox ID="TextBox2" runat="server" Height="32px"
Width="241px" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
</td>
<td>&nbsp;</td>
</tr>
</table>
<asp:Label ID="lblError" runat="server" Text=""></asp:Label>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceTourUpdate %>" DeleteCommand="DELETE FROM
[CUSTOMER] WHERE [CUS_LOGIN] = @CUS_LOGIN" InsertCommand="INSERT INTO [CUSTOMER]
([CUS_LOGIN], [CUS_PWD], [CUS_FNAME], [CUS_LNAME], [CUS_EMAIL], [CUS_YOB]) VALUES
(@CUS_LOGIN, @CUS_PWD, @CUS_FNAME, @CUS_LNAME, @CUS_EMAIL, @CUS_YOB)"
SelectCommand="SELECT * FROM [CUSTOMER] WHERE ([CUS_LOGIN] = @CUS_LOGIN)"
UpdateCommand="UPDATE [CUSTOMER] SET [CUS_LOGIN] = @CUS_LOGIN, [CUS_PWD] =
@CUS_PWD, [CUS_FNAME] = @CUS_FNAME, [CUS_LNAME] = @CUS_LNAME, [CUS_EMAIL] =
@CUS_EMAIL, [CUS_YOB] = @CUS_YOB WHERE [CUS_NUM] = @CUS_NUM" OnSelecting="SqlDataSource1_Selecting">
<DeleteParameters>
<asp:Parameter Name="CUS_LOGIN" />
</DeleteParameters>
<InsertParameters>
<asp:Parameter Name="CUS_LOGIN" Type="String" />
<asp:Parameter Name="CUS_PWD" Type="String" />
<asp:Parameter Name="CUS_FNAME" Type="String" />
<asp:Parameter Name="CUS_LNAME" Type="String" />
<asp:Parameter Name="CUS_EMAIL" Type="String" />
<asp:Parameter Name="CUS_YOB" Type="Int32" />
</InsertParameters>
<SelectParameters>
<asp:Parameter Name="CUS_LOGIN" Type="String" />
</SelectParameters>
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
<asp:Button ID="delete" runat="server" OnClick="btnDelete" CssClass="auto-style3" Text="Remove Account" />
</asp:Content>

