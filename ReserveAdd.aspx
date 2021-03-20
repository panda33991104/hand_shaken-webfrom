<%@ Page Title="" Language="C#" MasterPageFile="~/hand_server.Master" AutoEventWireup="true" CodeBehind="ReserveAdd.aspx.cs" Inherits="hand_shaken_webform.ReserveAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-bordered;" style=" width:500px">
        <tr>
            <td class="width:30%">入庫單號</td>
            <td>
                <asp:TextBox ID="Form_No" runat="server" BorderStyle="Solid" Width="95%" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>品項</td>
            <td>
                <asp:Dropdownlist ID="mat_name_List"  DataTextField='mat_name'  DataValueField="mat_id" runat="server"  CssClass="fulltext"  width="100%"  />
            </td>
        </tr>
        <tr>
            <td>庫存量</td>
            <td>
                <asp:TextBox ID="qty" runat="server" BorderStyle="Solid"  Width="95%"  ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>入庫人員</td>
            <td>
                <asp:Label ID="Reserve_man" runat="server"  Width="95%"  ></asp:Label>
            </td>
        </tr>
        <tr>
            <td>入庫時間</td>
            <td>
                <asp:TextBox ID ="Import_Date" TextMode="Date"   runat="server" />
            </td>
        </tr>
        <tr>
            <td>備註</td>
            <td>
                <asp:textbox ID="ProcessComment" runat="server" TextMode="MultiLine" Rows="10" Columns="80"   CssClass="fulltext" width="99%"  />
            </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left">
                <asp:Button ID="confirm"  Text="確認"  runat="server"  Width="95%" CssClass="btn btn-primary" OnClick="confirm_Click" />
            </td>
        </tr>
    </table></asp:Content>
