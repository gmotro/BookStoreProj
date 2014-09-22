<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserControlSample.aspx.cs" Inherits="MyTestWebApp.UserControlSample" %>
<%@ Register TagPrefix="scottgy" TagName="Calculator" Src="~/usercontrols/samplecontrol.ascx" %>
<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <scottgy:Calculator ID="calc" runat="server" />
</asp:Content>