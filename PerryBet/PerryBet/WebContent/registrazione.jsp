<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Registrati!</h1>
<form action="/PerryBet/RegistrazioneServlet" method="post">
	<label for="nome">Nome</label><br>
	<input type="text" name="nome" placeholder="Inserisci Nome"><br>
	<label for="cognome">Cognome</label><br>
	<input type="text" name="cognome" placeholder="Inserisci Cognome"><br>
	<label for="username">Username</label><br>
	<input type="text" name="username" placeholder="Inserisci Username"><br>
	<label for="password">Password</label><br>
	<input type="password" name="password" placeholder="Inserisci Password"><br>
	<label for="email">Email</label><br>
	<input type="text" name="email" placeholder="Inserisci E-mail"><br>
	<label for="CF">Codice Fiscale</label><br>
	<input type="text" name="CF" placeholder="Inserisci Codice Fiscale"><br>
	<label for="citta">Città</label><br>
	<input type="text" name="citta" placeholder="Inserisci Città"><br>
	<label for="indirizzo">Indirizzo</label><br>
	<input type="text" name="indirizzo" placeholder="Inserisci Indirizzo"><br>
	<label for="dataDiNascita">Data Di Nascita</label><br>
	<input type="text" name="dataDiNascita" placeholder="gg/mm/yyyy"><br>	
	
	<% String error =(String)request.getAttribute("error");
		if(error!=null && !error.equals("")) {	%>
		<p> <%= error %> </p>
		<%
		}
		%>
		
	<input type="submit" value="Registrati">
	
	
	
	

</form>
</body>
</html>