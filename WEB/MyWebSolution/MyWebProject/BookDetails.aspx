<%@ Page Title="AuthorDetails" Language="C#"  AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="MyWebProject.AuthorDetails" %>



<form id="form1" runat="server">

<asp:Literal runat="server" Id="litBookID"></asp:Literal>

    <Table ID="tbBookDetails" runat="server" visible="true" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label runat="server" text="Author Last Name" ID="lbLastName"></asp:Label>
                    </td>
                    <td>
                        <asp:textbox runat="server" id="tbLastName"></asp:textbox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:label runat="server" text="Author First Name" ID="lbFirstName"></asp:label>
                    </td>
                    <td>
                        <asp:textbox runat="server" id="tbFirstName"></asp:textbox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:label runat="server" text="Book Title" ID="lbBookTitle"></asp:label>
                    </td>
                    <td>
                        <asp:textbox runat="server" id="tbBookTitle"></asp:textbox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:label runat="server" text="Genre Name" ID="lbGenreName"></asp:label>
                    </td>
                    <td>
                        <asp:dropdownlist runat="server" id="ddGenre"></asp:dropdownlist>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:label runat="server" text="Publisher Name" ID="lbPublisherName"></asp:label>
                    </td>
                    <td>                        
                        <asp:dropdownlist runat="server" id="ddPublisher"></asp:dropdownlist>
                    </td>
                </tr>        
        </Table>

        <br />
        <br />

        <Table ID="tbSaveData" runat="server" visible="true" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:button runat="server" text="Save" id="btnSave" OnClick="btnSave_Click"/>
                    </td>
                    <td>
                        <asp:button runat="server" text="Close" id="btnCancel" onclientclick="window.close();" />                                            
                    </td>
                </tr>
        </Table>

</form>


