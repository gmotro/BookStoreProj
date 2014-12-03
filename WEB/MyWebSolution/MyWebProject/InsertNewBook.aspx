<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertNewBook.aspx.cs" Inherits="MyTestWebApp._Default" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">

    <Table ID="tbBookDetails" runat="server" visible="true" cellpadding="0" cellspacing="0" style="margin-bottom:5px;margin-top:5px" widht="100%>
                
                    
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
                        <asp:Label runat="server" text="Author Last Name" ID="lbLastName"></asp:Label>
                    </td>
                    <td>
                        <asp:textbox runat="server" id="tbLastName"></asp:textbox>
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
                        <asp:label runat="server" text="DOB" ID="lbDOB"></asp:label>
                    </td>
                    <td>
                        <asp:textbox runat="server" id="tbDOB"></asp:textbox>
                        <asp:CompareValidator id="DateValidator" runat="server" Operator="DataTypeCheck" Type="Date" ControlToValidate="tbDOB" ErrorMessage="Bad DOB format" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:label runat="server" text="Genre" ID="lbGenreName"></asp:label>
                    </td>
                    <td>
                        <asp:dropdownlist runat="server" id="ddGenre"></asp:dropdownlist>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:label runat="server" text="Publisher" ID="lbPublisherName"></asp:label>
                    </td>
                    <td>                        
                        <asp:dropdownlist runat="server" id="ddPublisher"></asp:dropdownlist>
                    </td>
                </tr>        
        </Table>

        <br />
        <br />

        <table ID="tbSaveData" runat="server" visible="true" cellpadding="0" cellspacing="0" style="margin-bottom:5px;margin-top:5px" widht="100%>
                <tr>
                    <td>
                        <asp:button runat="server" text="Save" id="btnSave" OnClick="btnSave_Click"/>
                    </td>
                    <td>
                        <asp:button runat="server" text="Clear" id="btnCancel" OnClick="btnClear_Click" />                                            
                    </td>
                </tr>
        </table>

</asp:Content>
