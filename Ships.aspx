<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Ships.aspx.cs" Inherits="sv1761.Ships" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 63%;
        }
        .auto-style2 {
            width: 320px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:DropDownList ID="ddShip" runat="server" AutoPostBack="True" DataSourceID="dsFill" DataTextField="SHIP_NAME" DataValueField="SHIP_ID" OnSelectedIndexChanged="ddShip_SelectedIndexChanged" Width="255px">
                    
                </asp:DropDownList>
            </td>   
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblPF" runat="server"></asp:Label>
                <asp:Label ID="lblPL" runat="server"></asp:Label>
                <br />
                <br />
                Ship Cap:<asp:Label ID="lblPLic" runat="server"></asp:Label>
                <br />
                <br />
                Pilot ID:
                <asp:Label ID="lblBio" runat="server"></asp:Label>
                <br />
            </td>
            <td>
                <asp:Image ID="ImgShip" runat="server" Height="189px" Width="236px" />
            </td>
        </tr>
    </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:SqlDataSource ID="dsShip" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceTourReader %>" SelectCommand="SELECT * FROM [SHIP] WHERE ([SHIP_ID] = @SHIP_ID) ORDER BY [SHIP_NAME]">
        <SelectParameters>
            <asp:Parameter Name="SHIP_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsFill" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceTourReader %>" SelectCommand="SELECT * FROM [SHIP] ORDER BY [SHIP_NAME]"></asp:SqlDataSource>
     
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ShipUpdate.aspx">Click here to update your ship details</asp:HyperLink>
</asp:Content>

