<%@page import="model.EventoModel, bean.EventoBean, java.util.*, java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="style.css" media="screen">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<table class="table">
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
					</tr>
				</tbody>
				<% 
				}
			}
			%>
			</table>
</body>
</html>