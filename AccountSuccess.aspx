<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AccountSuccess.aspx.cs" Inherits="sv1761.AccountSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Your account was created Successfully</p>
    <p>
        &nbsp;</p>
    <p>
        Click
        <asp:HyperLink ID="Here" runat="server" NavigateUrl="~/Login.aspx">Here</asp:HyperLink>
&nbsp;to login into your account</p>
</asp:Content>
