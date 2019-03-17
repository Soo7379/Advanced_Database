<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="updateRecipe.aspx.cs" Inherits="updateRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 class="text-center"><strong>Update a Recipe</strong></h1>
                <div class="well well-lg">
                    <ul class="list-group">
                        <h2>Recipe Information</h2>
                        <li class="list-group-item">
                            <asp:Label ID="txtRecipeID" runat="server" Text="Recipe ID:"></asp:Label>
                            <asp:TextBox ID="txtBxRecipeID" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtBxRecipeID" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Recipe ID is a required field."></asp:RequiredFieldValidator>
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="txtRecipeName" runat="server" Text="Recipe name:"></asp:Label>
                            <asp:TextBox ID="txtBxRecipeName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtBxRecipeName" ID="RFVRecipeName" runat="server" ErrorMessage="Recipe name is a required field."></asp:RequiredFieldValidator>
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="txtSubmittedBy" runat="server" Text="Submitted by:"></asp:Label>
                            <asp:TextBox ID="txtBxSubmittedBy" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtBxSubmittedBy" ID="RFVSubmittedBy" runat="server" ErrorMessage="Submitted by is a required field."></asp:RequiredFieldValidator>
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="txtCategoryType" runat="server" Text="Category type:"></asp:Label>
                            <asp:DropDownList ID="ddlCategoryType" runat="server" DataSourceID="SqlDSCategory" DataTextField="CATEGORYTYPE" DataValueField="CATEGORYID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDSCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COMP214_CATEGORIES&quot;"></asp:SqlDataSource>
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="txtCookingTime" runat="server" Text="Cooking time:"></asp:Label>
                            <asp:TextBox ID="txtBxCookingTime" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVCookingTime" ForeColor="Red" ControlToValidate="txtBxCookingTime" runat="server" ErrorMessage="Cooking Time is a required field."></asp:RequiredFieldValidator>
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="txtServings" runat="server" Text="Number of servings:"></asp:Label>
                            <asp:TextBox ID="txtBxServings" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtBxServings" ID="RFVServings" runat="server" ErrorMessage="Servings is a required field."></asp:RequiredFieldValidator>
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="lblCuisineType" runat="server" Text="Cuisine type:"></asp:Label>
                            <asp:DropDownList ID="ddlCuisineType" runat="server" DataSourceID="SqlDSCuisine" DataTextField="CUISINETYPE" DataValueField="CUISINEID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDSCuisine" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COMP214_CUISINES&quot;"></asp:SqlDataSource>
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="txtDescription" runat="server" Text="Recipe description:"></asp:Label>
                            <asp:TextBox ID="txtBxDescription" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtBxDescription" ID="RFVDescription" runat="server" ErrorMessage="Recipe description is a required field."></asp:RequiredFieldValidator>
                        </li>
                    </ul>
                    <asp:Button ID="btnUpdateRecipe" runat="server" Text="Update Recipe" OnClick="btnUpdateRecipe_Click" />
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" UpdateCommand="COMP214_UPDATE_RECIPE" UpdateCommandType="StoredProcedure">
                <UpdateParameters>
                    <asp:ControlParameter Name="P_RECIPEID" Type="Int32" ControlID="txtBxRecipeID" PropertyName="Text" />
                    <asp:ControlParameter Name="P_SUBMITTEDBY" Type="String" ControlID="txtBxSubmittedBy" PropertyName="Text" />
                    <asp:ControlParameter Name="IN_CATEGORYID" Type="Int32" ControlID="ddlCategoryType" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="P_COOKINGTIME" Type="String" ControlID="txtBxCookingTime" PropertyName="Text" />
                    <asp:ControlParameter Name="P_SERVINGS" Type="Int32" ControlID="txtBxServings" PropertyName="Text" />
                    <asp:ControlParameter Name="IN_CUISINEID" Type="Int32" ControlID="ddlCuisineType" PropertyName="SelectedValue"  />
                    <asp:ControlParameter Name="P_DESCRIPTION" Type="String" ControlID="txtBxDescription" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

