<%@ Page Title="" Language="C#" MasterPageFile="~/hand_server.Master" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="hand_shaken_webform.AddOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>訂單管理/新增訂購單</h3>
    <hr>
    
    <div class="row" style="margin-top: 5px;">
        <div class="col-lg-12">
            <h3 class="text-center col-lg-offset-0 thumbnail" style="background-color:#d71910;color:white;margin-bottom:5px;margin-top:5px">產品項目</h3>
            <div style="overflow: auto; height: 490px">
                <asp:GridView ID="product_Grid" runat="server" BackColor="white"
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                    AutoGenerateColumns="False" Width="100%" CellSpacing="5"
                    ForeColor="Black" GridLines="Both" HeaderStyle-Font-Bold="True" CssClass="table-bordered">
                    <Columns>
                        <asp:TemplateField HeaderText="商品名稱" HeaderStyle-Width="30%" ItemStyle-Width="20%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="prod_id" Text='<%# Eval("prod_id") %>' runat="server" Visible="false" />
                                <asp:Label ID="prod_name" Text='<%# Eval("prod_name") %>' runat="server" VerticalAlign='middle' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="冰塊" HeaderStyle-Width="15%" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemTemplate>
                                <asp:DropDownList ID="ice" runat="server" CssClass="form-control" >
                                <asp:ListItem Value="1">正常</asp:ListItem>
                                <asp:ListItem Value="2">少冰</asp:ListItem>
                                <asp:ListItem Value="3">微冰</asp:ListItem>
                                <asp:ListItem Value="4">去冰</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="甜度" HeaderStyle-Width="15%" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:DropDownList ID="suger" AutoPostBack="true" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="1">正常</asp:ListItem>
                                    <asp:ListItem Value="2">半糖</asp:ListItem>
                                    <asp:ListItem Value="3">少糖</asp:ListItem>
                                    <asp:ListItem Value="4">無糖</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="價格" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="price" Text='<%# Eval("price") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="數量" HeaderStyle-Width="15%" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:TextBox ID="qty" runat="server" CssClass="form-control" type="number" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="功能" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="black" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Button Text="確認" runat="server" CssClass="btn btn-primary btn-sm" CommandArgument='<%# Eval("prod_id") %>' OnCommand="Add_Item" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            
        </div>
        <div class="col-lg-6">
            <h3 class="text-center col-lg-offset-0 thumbnail" style="background-color:#d71910;color:white;margin-bottom:5px;margin-top:5px">客戶</h3>
            <div class="row" style="margin-bottom: 5px;">
                <div class="col-lg-6">
                    <label>客戶性別</label>
                    <asp:DropDownList ID="cust_Age" AutoPostBack="true" runat="server" CssClass="form-control" style="display:inline;width:75%;margin-left:5px">
                                <asp:ListItem Value="1">男</asp:ListItem>
                                <asp:ListItem Value="2">女</asp:ListItem>
                    </asp:DropDownList>
                                
                </div>
                <div class="col-lg-6">
                    <label>客戶年齡</label><asp:DropDownList ID="cust_Sex" AutoPostBack="true" runat="server" CssClass="form-control" Style="display: inline; width: 75%; margin-left: 5px">
                        <asp:ListItem Value="1">未滿20歲</asp:ListItem>
                        <asp:ListItem Value="2">20-40歲</asp:ListItem>
                        <asp:ListItem Value="3">40-60歲</asp:ListItem>
                        <asp:ListItem Value="4">60歲以上</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div style="overflow: auto; height: 450px">
                <asp:GridView ID="add_Product_Grid" runat="server" BackColor="white"
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                    AutoGenerateColumns="False" Width="100%" CellSpacing="5"
                    CaptionAlign="Top" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold="True" CssClass="table-bordered" ShowFooter="True">
                    <Columns>
                        <asp:TemplateField HeaderText="#" ItemStyle-Width="5%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("item_no") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="商品名稱" ItemStyle-Width="20%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="prod_id" Text='<%# Eval("prod_id") %>' runat="server" Visible="false" />
                                <asp:Label ID="prod_name" Text='<%# Eval("prod_name") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="冰塊" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("ice_id") %>' runat="server" Visible="false" />
                                <asp:Label Text='<%# Eval("ice") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="甜度" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("suger_id") %>' runat="server" Visible="false" />
                                <asp:Label Text='<%# Eval("suger") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="數量" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("qty") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="單價" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("price") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="功能" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Button Text="刪除" runat="server" CssClass="btn btn-danger btn-sm" CommandArgument='<%# Container.DataItemIndex %>' OnCommand="Del_Item" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
             <div class="text-left">
                <asp:Button  Text="結帳" runat="server" CssClass="btn btn-success" style="width:200px;height:50px;margin-top:5px"  OnCommand="Submit_Order"/>
             </div>
            </div>
        </div>
    </div>
   
</asp:Content>
