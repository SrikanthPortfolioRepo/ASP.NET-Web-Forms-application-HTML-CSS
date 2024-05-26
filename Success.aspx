<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="sv1761.Success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div>
            <h1>Welcome To Astro SpaceTour!!</h1>
                                    
            <br />
            You have successfully logged in</div>
        <asp:Label ID="lblCustomer" runat="server"></asp:Label>
        <br />
     
        <asp:HyperLink ID="HyperLink1" runat="server" Text="Click Here to go PilotAdmin" NavigateUrl="~/PilotAdmin.aspx"></asp:HyperLink>
        <br />
     <br />
       <h2>Account Management Options</h2>
        <asp:HyperLink ID="HyperLink2" runat="server" Text="Update my account" NavigateUrl="~/CustomerInfoUpdate.aspx"></asp:HyperLink>
    <br />    
    <asp:HyperLink ID="HyperLink3" runat="server" Text="Delete my account" NavigateUrl="~/Deletecustomer.aspx"></asp:HyperLink>
   
</asp:Content>
