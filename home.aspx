<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="container" Runat="Server">
  <div class="container">
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<h1 class="text-center"><strong>Welcome to Jason's recipe website!</strong></h1>
	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
		<h3><strong>About</strong></h3>
	    <div class="well well-lg">
	    <h4>This website will serve the purpose of a recipe database where users can view recipes, search and add recipes to the website.<br/>
            Functionality will be added overtime.
            <br/>
            <a href ="setup.aspx">Setup Page</a>
		</h4>
	    </div>
    </div>
    	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
		<h3><strong>Functionalities</strong></h3>
	    <div class="well well-lg">
			<ul class="list-group">
				<li class="list-group-item">View recipes</li>
				<li class="list-group-item">Search recipes</li>
				<li class="list-group-item">Add recipes</li>
			</ul>
	    </div>
    </div>
    </div>
   </div>
	</div>
</asp:Content>

