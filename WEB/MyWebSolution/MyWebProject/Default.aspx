<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyTestWebApp._Default" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">

        <br />
        <br />

        Author Firs Name : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        Author Last Name : <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
        Author DBO : <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />

    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" /><br />

</asp:Content>
