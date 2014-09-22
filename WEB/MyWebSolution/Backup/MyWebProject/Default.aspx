<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyTestWebApp._Default" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
       <h1>Hello World !</h1>
        <br />
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Height="43px" Text="Label" Width="147px" OnInit="Label1_Init"></asp:Label>
</asp:Content>
