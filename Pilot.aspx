<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pilot.aspx.cs" Inherits="sv1761.Pilot" %>

<!DOCTYPE html>
<style type="text/css">
.stylePilImage{
width:50%;
height:50%;
position:absolute;
top:33px;
}
#pilotImages{
position:absolute;
top:67px;
}
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
        <div>
        <label for="PilotsInformation">Select one pilot in the dropdown below:</label>
        <asp:DropDownList ID="PilotsInformation" runat="server" AutoPostBack="true"
OnSelectedIndexChanged="Pilots_selecting">
        </asp:DropDownList>
        <br />
<img id="pilotImages" runat="server" alt="Pilot Image" src="" class="stylePilImage"/>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SpaceTourReader %>" SelectCommand="SELECT [PIL_ID], [PIL_FNAME], [PIL_LNAME], [PIL_IMG] FROM [PILOT] WHERE ([PIL_ID] = @PIL_ID)">
<SelectParameters>
<asp:Parameter Name="PIL_ID" Type="Int32"/>
</SelectParameters>
</asp:SqlDataSource>
<p id="pilotName" runat="server">&nbsp;</p>
</div>
    </form>
</body>
</html>
