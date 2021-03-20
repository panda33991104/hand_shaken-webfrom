<%@ Page Title="" Language="C#" MasterPageFile="~/hand_server.Master" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="hand_shaken_webform.Reserve" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>庫存管理</h2>
    <hr>
    <div style="width:100%; margin-right:50px;margin-top:10px; text-align:right">
    </div>
    <div style="border:5px #669999 solid; border-top-left-radius:20pt;border-top-right-radius:20pt; padding:5px; background-color:#669999;">
        <asp:GridView ID="ResGrid" runat="server" BackColor="white"
            BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" OnRowCommand="ResGrid_RowCommand"
            AutoGenerateColumns="False" Width="100%" CellSpacing="5" AllowPaging="true" PagerSettings-Mode="Numeric" PageSize="10"
            CaptionAlign="Top" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold='false' onpageindexchanging="ResGrid_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="入庫單號"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:label ID="Form_No"  Text='<%# Eval("Form_No") %>'  runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="品項"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:label ID="mat_name"  Text='<%# Eval("mat_name") %>'  runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="庫存量"  ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:label ID="qty"  Text='<%# Eval("qty") %>'  runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="入庫人員"  ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:label ID="Emp_Id"  Text='<%# Eval("Emp_Id") %>'  runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="入庫時間"  ItemStyle-Width="20%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:label ID="import_date"  Text='<%# Eval("import_date") %>'  runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="備註"  ItemStyle-Width="20%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:label ID="comment"  Text='<%# Eval("comment") %>'  runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText=""  ItemStyle-Width="10%" HeaderStyle-Font-Bold='false'>
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:LinkButton ID="Deldetial" runat="server" CssClass="btn btn-danger" Text="刪除"  CommandName="Deldetial"  CommandArgument='<%# Eval("Form_no") %>'/>
                        <asp:LinkButton ID="Editdetial" runat="server" CssClass="btn btn-info" Text="更新"  CommandName="Editdetial"  CommandArgument='<%# Eval("Form_no") %>'  />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#669999" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#F7F7DE" />
            <RowStyle BackColor="#ffffff" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>

</asp:Content>
