<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchBookInfo.aspx.cs" Inherits="MyWebProject.SearchAuthor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script language="javascript" type="text/javascript">
        function getBookDetails(BookID)
        {
            window.open("BookDetails.aspx?BookID=" + BookID, "_blank", "toolbar=0,width=780,height=500,resizable=1,scrollbars=1");
            return false;
        }
    </script>

        <Table ID="tbBookDetails" runat="server" visible="true" cellpadding="0" cellspacing="0" style="margin-bottom:5px;margin-top:5px" widht="100%>
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
                        <asp:Label runat="server" text="Genre" ID="lbGenreName"></asp:Label>
                    </td>
                    <td>
                        <asp:dropdownlist runat="server" id="ddGenre"></asp:dropdownlist>
                    </td>
                </tr>
            </Table>

<asp:Button ID="bnSearch" runat="server" OnClick="bnSearch_Click" Text="Search" /><br />
<br />
<br />

    <table id="resultContainer" runat="server" visible="true" cellpadding="0" cellspacing="0" style="margin-bottom:5px;margin-top:5px" widht="100%">
        <tr>
            <td>
            <asp:GridView ID="BookInfoGrid" runat="server" AutoGenerateColumns="false"
                          OnRowDataBound="BookInfoGrid_RowDataBound"
                          BorderWidth="0" CellPadding="1" GridLines="None" Width="100%">
                <RowStyle HorizontalAlign="Left" />
                <Columns>
           
                    <asp:TemplateField HeaderText="Last Name"  HeaderStyle-Font-Bold="true" >
                        <ItemTemplate>                            
                            <asp:Label runat="server" ID="lbLastName" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="First Name" HeaderStyle-Font-Bold="true" >
                        <ItemTemplate>                 
                            <asp:Label runat="server" ID="lbFirstName" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Date Of Birth" HeaderStyle-Font-Bold="true" >
                        <ItemTemplate>                 
                            <asp:Label runat="server" ID="lbDOB" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Title" HeaderStyle-Font-Bold="true" >
                        <ItemTemplate>  
                            <asp:LinkButton runat="server" ID="linkTitle" />                                           
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="GenreName" HeaderStyle-Font-Bold="true" >
                        <ItemTemplate>                 
                            <asp:Label runat="server" ID="lbGenre" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="PublisherName" HeaderStyle-Font-Bold="true" >
                        <ItemTemplate>                 
                            <asp:Label runat="server" ID="lbPublisher" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    

                </Columns>      
             </asp:GridView>
                
            </td>
        </tr>
    </table>

</asp:Content>




