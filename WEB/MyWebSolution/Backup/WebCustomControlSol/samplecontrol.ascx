<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="samplecontrol.ascx.cs" Inherits="MyUserControlLibrary.samplecontrol" %>
Calculator<br />
<br />
Value 1:<asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox><br />
<br />
Value2:
<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" /><br />
<br />
<asp:Label ID="Label1" runat="server" Text="Label" Width="75px"></asp:Label>
