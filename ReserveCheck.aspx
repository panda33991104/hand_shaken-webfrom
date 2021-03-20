<%@ Page Title="" Language="C#" MasterPageFile="~/hand_server.Master" AutoEventWireup="true" CodeBehind="ReserveCheck.aspx.cs" Inherits="hand_shaken_webform.ReserveCheck" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3>庫存審核單</h3>
    <div>
        <asp:GridView ID="ResGrid" runat="server" BackColor="White" 
            BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="4" AutoGenerateColumns="False" Width="100%" CellSpacing="5"  
            RowStyle-BorderWidth="1"  RowStyle-BorderColor="black" AlternatingRowStyle-BackColor="PaleGreen"
            CaptionAlign="Top" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold='false' OnRowCommand="ResGrid_RowCommand">

            <Columns>
                <asp:TemplateField HeaderText="現況"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:linkbutton ID="Status"  Text='<%# Eval("Status") %>'  runat="server" CommandName="viewItem"  CommandArgument='<%# Eval("form_no") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <Columns>
                <asp:TemplateField HeaderText="單號"  ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:linkbutton ID="Form_No"  Text='<%# Eval("Form_No") %>'  runat="server" CommandName="viewItem"  CommandArgument='<%# Eval("form_no") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <Columns>
                <asp:TemplateField HeaderText="入庫人員"  ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:linkbutton ID="Emp_Id"  Text='<%# Eval("Emp_Id") %>'  runat="server" CommandName="viewItem"  CommandArgument='<%# Eval("form_no") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <Columns>
                <asp:TemplateField HeaderText="入庫時間"  ItemStyle-Width="25%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:linkbutton ID="import_date"  Text='<%# Eval("import_date") %>'  runat="server" CommandName="viewItem"  CommandArgument='<%# Eval("form_no") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <Columns>
                <asp:TemplateField HeaderText="備註"  ItemStyle-Width="25%" HeaderStyle-Font-Bold='false' HeaderStyle-CssClass="text-center">
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:linkbutton ID="comment"  Text='<%# Eval("comment") %>'  runat="server" CommandName="viewItem"  CommandArgument='<%# Eval("form_no") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>


            <Columns>
                <asp:TemplateField HeaderText=""  ItemStyle-Width="25%" HeaderStyle-Font-Bold='false'  HeaderStyle-CssClass="text-center">
                    <HeaderStyle Font-Bold="False" />
                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                    <ItemTemplate>
                        <asp:LinkButton ID="Edit" runat="server" CssClass="btn btn-info" Text="簽辦"  CommandName="editItem"  CommandArgument='<%# Eval("form_no") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
    </div>

</asp:Content>
