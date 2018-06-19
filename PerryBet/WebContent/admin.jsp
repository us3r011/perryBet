<%@page import="model.*, bean.*, java.util.*, java.sql.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script><title>Insert title here</title>
</head>
<body>
	<h2>Inserisci evento</h2>
	<form  class="form" method="post"	 action="EventoServlet">
		<label>Palinsesto</label>
		<input  type="text" name="palinsesto" id="palinsesto" class="span3">
		<label>Evento</label>
		<input type="text" name="evento"class="span3">
		<label>Data</label>
		<input type="text" name="data" id="date" class="span3">
		<label>Squadra Casa</label>
		<input type="text" name="squadraCasa" class="span3">
		<label>Squadra Trasferta</label>
		<input type="text" name= "squadraTrasferta" class="span3">
		<label>Quota 1</label>
		<input required type="text" name="quota1" class="span3">
		<label>Quota X</label>
		<input required type="text" name="quotaX" class="span3">
		<label>Quota 2</label>
		<input required type="text" name="quota2" class="span3">
		<br>
		<input type="submit" value="inserisci">
		
		
		
		<table  class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Palinsesto</th>
				<th scope="col">Evento</th>
				<th scope="col">Data</th>
				<th scope="col">Squadra Casa</th>
				<th scope="col">Squadra Casa</th>
				<th scope="col"> 1 </th>
				<th scope="col"> X </th>
				<th scope="col"> 2 </th>
				<th scope ="col"> Modifica </th>
				<th scope ="col"> Elimina </th>	
			</tr>
		</thead>
			
			<%
			EventoModel model = new EventoModel();
			Collection<EventoBean> eventi = new ArrayList<EventoBean>();
			
			eventi = model.doRetrieveAll();
			
			if(eventi != null & eventi.size() > 0) {
				Iterator<?> it = eventi.iterator();
				while (it.hasNext()) {
					EventoBean bean = (EventoBean)it.next();
					%>
				<tbody>
					<tr>
					
						<td><%= bean.getEvento()  %></td>
						<td><%= bean.getPalinsesto() %></td>
						<td><%= bean.getData()%></td>
						<td><%= bean.getSquadraCasa() %></td>
						<td><%= bean.getSquadraTrasferta() %></td>
						<td><%= bean.getQuota1()%></td>
						<td><%= bean.getQuotaX()%></td>
						<td><%= bean.getQuota2() %></td>
						<td><button type="submit" value="Modifica"></button></td>
						<td><button value="Elimina" onclick=""></button></td>
						
					</tr>
				</tbody>
				<% 
				}
			}
			%>
			</table>

	</form>
	
	<h1>Lista Utenti</h1>
	<table>
		<thead>
			<tr>
				<th scope = "col">CF</th>
				<th scope = "col">Nome</th>
				<th scope = "col">Cognome</th>
				<th scope = "col">Username</th>
				<th scope = "col">Password</th>
				<th scope = "col">Email</th>
				<th scope = "col">Città</th>
				<th scope = "col">Indirizzo</th>
				<th scope = "col">Data Di Nascita</th>
				<th scope = "col">Codice Conto</th>
				<th scope = "col">Admin</th>
			</tr>
		</thead>
		
		<% 
			UtenteModel utentemodel = new UtenteModel();
			Collection<UtenteBean> utenti = new ArrayList<UtenteBean>();
			
			utenti = utentemodel.doRetrieveAll();
			
			if(utenti != null & utenti.size() > 0) {
				Iterator<?> it = utenti.iterator();
				while(it.hasNext()) {
					UtenteBean utente = (UtenteBean)it.next();
					%>
					<tbody>
						<tr>
							<td><%= utente.getCF() %></td>
							<td><%= utente.getNome() %></td>
							<td><%= utente.getCognome() %></td>
							<td><%= utente.getUser() %></td>
							<td><%= utente.getPassword() %></td>
							<td><%= utente.getEmail() %></td>
							<td><%= utente.getCittà() %></td>
							<td><%= utente.getIndirizzo() %></td>
							<td><%= utente.getDataDiNascita() %></td>
							<td><%= utente.getCodiceConto() %></td>
							<td><%= utente.isAdmin() %></td>
						</tr>
					</tbody>
		<%
				}
			}
		%>
			
	</table>
		
	

</body>
</html>



