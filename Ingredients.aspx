<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Ingredients.aspx.cs" Inherits="Ingredients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" Runat="Server">
    <div class="container">
    <div class="row">
	    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="INGREDIENTID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="INGREDIENTID" HeaderText="INGREDIENTID" ReadOnly="True" SortExpression="INGREDIENTID" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                    <asp:BoundField DataField="QUANTITY" HeaderText="QUANTITY" SortExpression="QUANTITY" />
                    <asp:BoundField DataField="UNITOFMEASURE" HeaderText="UNITOFMEASURE" SortExpression="UNITOFMEASURE" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COMP214_INGREDIENTS&quot;"></asp:SqlDataSource>
        </div>
    </div>
</div>
</asp:Content>

