<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>fail</title>
</head>
<body>


					   	   <% String error=(String)request.getAttribute("error");
						    		 
				      			if(error!=null || error.equals("Invalid username and password")){
				    	  %>
				     		  <script>
				     	 		alert("Invalid username and password");
				     	 		{window.location.href='index.jsp';}
				   		 	</script>	
				  	     <% 
				    		}
				    	 %>

</body>
</html>