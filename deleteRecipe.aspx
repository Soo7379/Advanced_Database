<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="deleteRecipe.aspx.cs" Inherits="deleteRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" Runat="Server">
    <div class="container">
    <div class="row">
	    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	        <h1 class="text-center"><strong>Delete Recipe</strong></h1>
            <asp:Label ID="lblRecipeID" runat="server" Text="Enter Recipe ID "></asp:Label>
            <asp:TextBox ID="txtBxRecipeID" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnDeleteRecipe" runat="server" Text="Delete Recipe" OnClick="btnDeleteRecipe_Click" />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="COMP214_DELETE_RECIPE" DeleteCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
                <DeleteParameters>
                    <asp:ControlParameter Name="RECIPE_ID" Type="Int32" ControlID="txtBxRecipeID" PropertyName="Text"/>
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</div>
</asp:Content>

