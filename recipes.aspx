<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="recipes.aspx.cs" Inherits="recipes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" Runat="Server">
<div class="container">
    <div class="row">
	    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RECIPEID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="RECIPEID" HeaderText="RECIPEID" ReadOnly="True" SortExpression="RECIPEID" />
                    <asp:BoundField DataField="SUBMITTEDBY" HeaderText="SUBMITTEDBY" SortExpression="SUBMITTEDBY" />
                    <asp:BoundField DataField="CATEGORYTYPE" HeaderText="CATEGORYTYPE" SortExpression="CATEGORYTYPE" />
                    <asp:BoundField DataField="COOKINGTIME" HeaderText="COOKINGTIME" SortExpression="COOKINGTIME" />
                    <asp:BoundField DataField="SERVINGS" HeaderText="SERVINGS" SortExpression="SERVINGS" />
                    <asp:BoundField DataField="CUISINE" HeaderText="CUISINE" SortExpression="CUISINE" />
                    <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
                    <asp:BoundField DataField="DATEENTERED" HeaderText="DATEENTERED" SortExpression="DATEENTERED" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COMP214_RECIPES&quot;"></asp:SqlDataSource>
            <br />
        </div>
    </div>
</div>
</asp:Content>


