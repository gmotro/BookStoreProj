<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="samplecontrol.ascx.cs" Inherits="MyUserControlLibrary.samplecontrol" %>
Author Search<br />
<br />
Author Last Name : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" /><br />
<br />
<br />
<asp:GridView ID="gvAuthors" runat="server" />
