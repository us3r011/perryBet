<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<link type="text/css" rel="stylesheet" href="style.css" media="screen">
<title>PerryBet</title>
</head>
<body>
	<header>
		<div class="block">
			<div class="top">
				<a class="logo" href="#">
					<img alt="logo_image" src="">
				</a> 			
				<div class="login">
					<form class="form-horizontal" action="/PerryBet/LoginServlet" method="post">

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="username">User</label>  
  <div class="col-md-4">
  <input id="userName" name="username" type="text" placeholder="user" class="form-control input-md">
    
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="passwordinput">Password</label>
  <div class="col-md-4">
    <input id="passwordinput" name="password" type="password" placeholder="********" class="form-control input-md">
    
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="btnCancel"></label>
  <div class="col-md-8">
    <button id="btnLogin" name="btnLogin" class="btn btn-default"><b>Login</b></button>
    <button id="btnRegistrati" name="btnRegistrati" class="btn btn-default"><b>Registrati</b></button>
  </div>
  
</div>


</form>
<% String error = (String)request.getAttribute("error"); %>


					
				</div>
			</div>
				
			<nav class="navbar">
				<ul>
					<li><a href="index.jsp">HOME</a></li>
					<li><a href="campionati.jsp">CAMPIONATI</a></li>
					<li><a href="contatti.jsp">CONTATTI</a></li>
					<li><a href="about.jsp">ABOUT</a></li>
				</ul>
			</nav>
		</div>
	</header>
	
	<aside>
		<div class="sidenav">
			<button class="dropdown-button">Nazione 1
				<i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-container">
				<a href="#">Campionato 1</a>
				<a href="#">Campionato 2</a>
				<a href="#">Campionato 3</a>
			</div>
			<button class="dropdown-button">Nazione 2
				<i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-container">
				<a href="#">Campionato 1</a>
				<a href="#">Campionato 2</a>
				<a href="#">Campionato 3</a>
			</div>
			
			<button class="dropdown-button">Nazione 3
				<i class="fa fa-caret-down"></i>
			</button>
			
			<div class="dropdown-container">
				<a href="#">Campionato 1</a>
				<a href="#">Campionato 2</a>
				<a href="#">Campionato 3</a>
			</div>
			
			<script>
			/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content 
			- This allows the user to have multiple dropdowns without any conflict */
			var dropdown = document.getElementsByClassName("dropdown-button");
			var i;
			
			for (i = 0; i < dropdown.length; i++) {
			  dropdown[i].addEventListener("click", function() {
			    this.classList.toggle("active");
			    var dropdownContent = this.nextElementSibling;
			    if (dropdownContent.style.display === "block") {
			      dropdownContent.style.display = "none";
			    } else {
			      dropdownContent.style.display = "block";
			    }
			  });
			}
			</script>
		</div>
	</aside>
	
	<div class="main-content"> 
		<div class="box-title">
			<h2 class="title-inEvidenza"> EVENTI IN EVIDENZA </h2>
		</div>
		<section>
			<table id="customers">
  <tr>
    <th>Data</th>
    <th>Ora</th>
    <th>Evento</th>
	
	<th>1</th>
	<th>X</th>
	<th>2</th>
  </tr>
  <tr>
    <td>10/10/2010</td>
    <td>20:30</td>
    <td>Germany - Italy</td>
    <td class="clickable" onclick="#">1.60</td>
    <td class="clickable" onclick="#">1.60</td>
    <td class="clickable" onclick="#">1.60</td>
  </tr>
  <tr>
    <td>10/10/2010</td>
    <td>20:30</td>
    <td>Germany - Italy</td>
    <td class="clickable" onclick="#">1.60</td>
    <td class="clickable" onclick="#">1.60</td>
    <td class="clickable" onclick="#">1.60</td>
  </tr>
 </table>
		</section>
	</div>
	
		
</body>
</html>