<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addIngredient.aspx.cs" Inherits="addIngredient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="well well-lg">
                    <ul class="list-group">
                        <h2>Ingredients</h2>
                        <li class="list-group-item">
                            <asp:Label ID="txtRecipeID" runat="server" Text="Recipe ID:"></asp:Label>
                            <asp:TextBox ID="txtBxRecipeID" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBxRecipeID" ErrorMessage="Recipe ID is a required field." ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="txtName" runat="server" Text="Ingredient Name:"></asp:Label>
                            <asp:TextBox ID="txtBxName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVName" runat="server" ControlToValidate="txtBxName" ErrorMessage="Ingredient name is a required field." ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="txtQunatity" runat="server" Text="Quantity:"></asp:Label>
                            <asp:TextBox ID="txtBxQuantity" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="REVQuantity" runat="server" ControlToValidate="txtBxQuantity" ErrorMessage="Quantity must be a number." ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                            <br />
                        </li>
                        <li class="list-group-item">
                            <asp:Label ID="txtUnitOfMeasure" runat="server" Text="Unit of Measure:"></asp:Label>
                            <asp:TextBox ID="txtBxUnitOfMeasure" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVUnitOfMeasure" runat="server" ControlToValidate="txtBxUnitOfMeasure" ErrorMessage="Unit of Measure is a required field." ForeColor="Red"></asp:RequiredFieldValidator>
                        </li>
                        <br />
                        <asp:Button ID="btnAddIngredient" runat="server" Text="Add Ingredient" OnClick="btnAddIngredient_Click" />
                    </ul>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="COMP214_INSERT_INGREDIENT" InsertCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
                    <InsertParameters>
                        <asp:ControlParameter Name="RECIPEID" Type="Int32" ControlID="txtBxRecipeID" PropertyName="Text" />
                        <asp:ControlParameter Name="NAME" Type="String" ControlID="txtBxName" PropertyName="Text" />
                        <asp:ControlParameter Name="QUANTITY" Type="Int32" ControlID="txtBxQuantity" PropertyName="Text" />
                        <asp:ControlParameter Name="UNITOFMEASURE" Type="String" ControlID="txtBxUnitOfMeasure" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

