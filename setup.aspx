<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="setup.aspx.cs" Inherits="setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" Runat="Server">
<div class="container">
    <div class="row">
	    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem>Light Theme</asp:ListItem>
                <asp:ListItem>Dark Theme</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            <br />
        </div>
    </div>
</div>
</asp:Content>

