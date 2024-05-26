<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PilotAdmin.aspx.cs" Inherits="sv1761.PilotAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .spacing_id{
            margin-left:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblCustomer" runat="server"></asp:Label>
<div class="spacing_id">
<h2>Insert Pilot Information</h2>
<asp:ValidationSummary ID="ValidatingID" runat="server" />
<asp:TextBox ID="Pilot_Identity" runat="server" placeholder="Pilot ID"
ValidationGroup="PilotAddvalid"></asp:TextBox>
<asp:RequiredFieldValidator ID="ap_PilotID" runat="server" ControlToValidate="Pilot_Identity"
ErrorMessage="PilotID is required" ValidationGroup="PilotAddvalid"></asp:RequiredFieldValidator>
<br />
<br />
<asp:TextBox ID="Pilot_license" runat="server" placeholder="License"
ValidationGroup="PilotAddvalid"></asp:TextBox>
<asp:RequiredFieldValidator ID="ap_Pilotlic" runat="server" ControlToValidate="Pilot_license"
ErrorMessage="License is required" ValidationGroup="PilotAddvalid"></asp:RequiredFieldValidator>
<br />
<br />
<asp:TextBox ID="Pilot_firstname" runat="server" placeholder="First Name"
ValidationGroup="PilotAddvalid"></asp:TextBox>
<asp:RequiredFieldValidator ID="ap_Pilotfname" runat="server" ControlToValidate="Pilot_firstname"
ErrorMessage="FirstName is required"
ValidationGroup="PilotAddvalid"></asp:RequiredFieldValidator>
<br />
<br />
<asp:TextBox ID="Pilot_lastname" runat="server" placeholder="Last Name"
ValidationGroup="PilotAddvalid"></asp:TextBox>
<asp:RequiredFieldValidator ID="ap_Pilotlname" runat="server" ControlToValidate="Pilot_lastname"
ErrorMessage="LastName is required"
ValidationGroup="PilotAddvalid"></asp:RequiredFieldValidator>
<br />
<br />
<asp:TextBox ID="Pilot_biography" runat="server" placeholder="Bio"
ValidationGroup="PilotAddvalid"></asp:TextBox>
<asp:RequiredFieldValidator ID="ap_Pilotbio" runat="server" ControlToValidate="Pilot_biography"
ErrorMessage="Bio is required" ValidationGroup="PilotAddvalid"></asp:RequiredFieldValidator>
<br />
<br />
<asp:TextBox ID="Pilot_image" runat="server" placeholder="Image Path"
ValidationGroup="PilotAddvalid"></asp:TextBox>
<asp:RequiredFieldValidator ID="ap_Pilotimg" runat="server" ControlToValidate="Pilot_image"
ErrorMessage="Image file path is required"
ValidationGroup="PilotAddvalid"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Button ID="btnInsertPilot" runat="server" Text="Add new Pilot" OnClick="AddNewPilot" />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceTourWriter %>" SelectCommand="SELECT [PIL_FNAME], [PIL_LNAME], [PIL_IMG], [PIL_ID] FROM [PILOT] WHERE ([PIL_ID] = @PIL_ID)">
<SelectParameters>
<asp:Parameter Name="PIL_ID" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>
<asp:Label ID="ErrorInfo" runat="server" ForeColor="Red"></asp:Label>
</div>
</asp:Content>
