<%@ Page Title="" Language="C#" MasterPageFile="~/hand_server.Master" AutoEventWireup="true" CodeBehind="ReserveEdit.aspx.cs" Inherits="hand_shaken_webform.ReserveEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>庫存管理更新</h2>
    <hr>
    <table class="table table-bordered;" style=" width:500px">
        <tr>
            <td>入庫單號</td>
            <td>
                <asp:label ID="Form_No"  Text='<%# Eval("Form_No") %>'  runat="server"  CssClass="form-control"/>
               
            </td>
        </tr>
        <tr>
            <td>品項</td>
            <td>
                <asp:label ID="mat_name"  Text='<%# Eval("mat_name") %>'  runat="server"  CssClass="form-control"/>
            </td>
        </tr>
        <tr>
            <td>庫存量</td>
            <td>
                <asp:Label ID="price" Text='<%# Eval("price") %>' runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>入庫人員</td>
            <td>
                <asp:Dropdownlist ID="Emp_Id_List"  DataTextField='Emp_Name'  DataValueField="Emp_Id" runat="server"  CssClass="fulltext" width="100%"  />
                <asp:label ID="Emp_Id"  Text='<%# Eval("Emp_Id") %>'  runat="server" CssClass="form-control"  />
            </td>
        </tr>
        <tr>
            <td>入庫時間</td>
            <td>
                <asp:linkbutton ID="import_date"  Text='<%# Eval("import_date") %>'  runat="server"  CssClass="form-control"  />
            </td>
        </tr>
        <tr>
            <td>備註</td>
            <td>
                <asp:textbox ID="ProcessComment" runat="server" TextMode="MultiLine" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td>
                <a runat="server" href="~/Student">放棄</a>
            </td>
            <td style="text-align:left">
                <asp:Button ID="confirm"  Text="確認更新"  runat="server"  Width="95%" CssClass="btn btn-primary"/>
            </td>
        </tr>
    </table>
</asp:Content>
