<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShipUpdate.aspx.cs" Inherits="sv1761.ShipUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:ScriptManager runat="server"></asp:ScriptManager>
 
<div>
<label for="txt_ShipID">Ship ID:</label>
<asp:TextBox ID="txt_ShipID" runat="server"></asp:TextBox>
<br />
<br />
</div>
<div>
<label for="txt_ShipName">Ship Name:</label>
<asp:TextBox ID="txt_ShipName" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfv_ShipName" runat="server" ControlToValidate="txt_ShipName" ErrorMessage="Ship name is required" ValidationGroup="AddingShipValidation"></asp:RequiredFieldValidator>
<br />
<br />
</div>
<div>
<label for="txt_ShipDesc">Ship Description:</label>
<asp:TextBox ID="txt_ShipDesc" runat="server"></asp:TextBox>
<br />
<br />
</div>
<div>
<label for="fu_ShipImage">Ship Image:</label>
<asp:FileUpload ID="fu_ShipImage" runat="server" />
<br />
<br />
</div>
<div>
    <label for="txt_ShipCap">Ship Capacity:</label>
<asp:TextBox ID="txt_ShipCap" runat="server"></asp:TextBox>
<br />
<br />
</div>
 
<div>
<asp:Button ID="UpdateShip" runat="server" Text="Update Ship" OnClick="UpdateShip_Click" />
<asp:Label ID="lblShipError" runat="server" ForeColor="Red"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceTourUpdate %>" SelectCommand="SELECT * FROM [SHIP] WHERE ([SHIP_NAME] = @SHIP_NAME)">
        <SelectParameters>
            <asp:Parameter Name="SHIP_NAME" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>

</asp:Content>
