<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="errorLog.aspx.cs" Inherits="errorLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" Runat="Server">
    <div class="container">
    <div class="row">
	    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ERRORLOGID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ERRORLOGID" HeaderText="ERRORLOGID" ReadOnly="True" SortExpression="ERRORLOGID" />
                    <asp:BoundField DataField="ERRORTIME" HeaderText="ERRORTIME" SortExpression="ERRORTIME" />
                    <asp:BoundField DataField="ERRORNAME" HeaderText="ERRORNAME" SortExpression="ERRORNAME" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COMP214_ERRORLOG&quot;"></asp:SqlDataSource>
        </div>
    </div>
</div>
</asp:Content>

