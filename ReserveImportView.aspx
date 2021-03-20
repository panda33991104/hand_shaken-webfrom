<%@ Page Title="" Language="C#" MasterPageFile="~/hand_server.Master" AutoEventWireup="true" CodeBehind="ReserveImportView.aspx.cs" Inherits="hand_shaken_webform.ReserveImportView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3>庫存審核單</h3>
    <style>
        .title{
            background-color: lavender;
            color: Red;
            border-bottom-color:white;
            border-bottom-width:2px;
            border-bottom-style:solid;
        }
    </style>

    <div class="container">
        <div class="row">
            <div class="col-md-6" >
                <table class="table table-bordered">
                    <tr>
                        <td style="background-color:lavender; color:Red;">進貨明細:</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center">
                            <asp:GridView ID="ResGrid" runat="server" BackColor="white"
                                     BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" 
                                     AutoGenerateColumns="False" Width="100%" CellSpacing="5"  
                                     CaptionAlign="Top" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold='false'>
                                <Columns>
                                    <asp:TemplateField HeaderText="進貨單號"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'  HeaderStyle-CssClass="text-center">
                                        <HeaderStyle Font-Bold="False" />
                                        <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:label ID="Form_No"  Text='<%# Eval("Form_No") %>'  runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="料號"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                                        <HeaderStyle Font-Bold="False" />
                                        <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:label ID="mat_id"  Text='<%# Eval("mat_id") %>'  runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="料名"  ItemStyle-Width="20%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                                        <HeaderStyle Font-Bold="False" />
                                        <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:label ID="mat_name"  Text='<%# Eval("mat_name") %>'  runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="數量"  ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                                        <HeaderStyle Font-Bold="False" />
                                        <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:label ID="qty"  Text='<%# Eval("qty") %>'  runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="金額"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                                        <HeaderStyle Font-Bold="False" />
                                        <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:label ID="price"  Text='<%# Eval("price") %>'  runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="備註"  ItemStyle-Width="40%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                                        <HeaderStyle Font-Bold="False" />
                                        <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:label ID="comment"  Text='<%# Eval("comment") %>'  runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#669999" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                        </td>
                    </tr>

                    <tr>
                        <td style="background-color:lavender; color:Red;">驗貨情況:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="ProcessGrid" runat="server" BackColor="white"
                                     BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" 
                                     AutoGenerateColumns="False" Width="100%" CellSpacing="5"  
                                     CaptionAlign="Top" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold='false'  >
                                <Columns>
                                    <asp:TemplateField HeaderText="進貨單號"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                                        <HeaderStyle Font-Bold="False" />
                                        <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:label ID="Form_No"  Text='<%# Eval("Form_No") %>'  runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="簽辦人"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                                        <HeaderStyle Font-Bold="False" />
                                        <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:label ID="Emp_Id"  Text='<%# Eval("Emp_Id") %>'  runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    
                                    <asp:TemplateField HeaderText="簽辦時間"  ItemStyle-Width="40%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                                        <HeaderStyle Font-Bold="False" />
                                        <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:label ID="Verify_Date"  Text='<%# Eval("Verify_Date") %>'  runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="備註"  ItemStyle-Width="35%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                                        <HeaderStyle Font-Bold="False" />
                                        <ItemStyle HorizontalAlign='left' VerticalAlign="Top" />
                                        <ItemTemplate>
                                            <asp:label ID="Comment"  Text='<%# Eval("Comment") %>'  runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <FooterStyle BackColor="#CCCC99"/>
                                <HeaderStyle BackColor="#669999" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                                <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#F7F7DE" />
                                <RowStyle BackColor="#ffffff" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </div>
            
            <div class="col-md-6" >
                <table class="table table-bordered;" style=" width:500px">
                    <tr>
                        <td class="title">進貨單號</td>
                        <td>
                            <asp:Label ID="Form_No" runat="server"  Width="95%"  ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:30%" class="title">現況</td>
                        <td>
                        <asp:Label ID="Status_Comment" runat="server" />
                        (<asp:Label ID="Status_Id" runat="server" />)
                        </td>
                    </tr>
                    <tr>
                        <td class="title">入庫人</td>
                        <td>
                            <asp:Label ID="Emp_Id" runat="server"  Width="95%"  ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">入庫日期</td>
                        <td>
                            <asp:Label ID ="Import_Date" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title" >廠商</td>
                        <td>
                            <asp:Label ID ="Vendor_Name"  runat="server" />
                            (<asp:Label ID ="Vendor_Id"  runat="server" />)
                        </td>
                        </tr>
                    <tr>
                        <td class="title">備註</td>
                        <td>
                            <asp:Label ID="Comment" runat="server"   CssClass="fulltext" width="99%"  />
                        </td>
                    </tr>
                </table>
            </div>

        </div>
    </div>

</asp:Content>
