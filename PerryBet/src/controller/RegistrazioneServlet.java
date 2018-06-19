package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UtenteBean;
import model.UtenteModel;

/**
 * Servlet implementation class RegistrazioneServlet
 */
@WebServlet("/RegistrazioneServlet")
public class RegistrazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	boolean flag = false;
	static UtenteModel model = new UtenteModel();
       
    public RegistrazioneServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = "";
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String CF = request.getParameter("CF");
		String citta = request.getParameter("citta");
		String indirizzo = request.getParameter("indirizzo");
		Date dataDiNascita = setData(request);
		
		if(username == null || username.trim().equals("")) {
			error += "Inserisci Username <br>";
		} else {
			request.setAttribute("username", username);
		}
		
		if(password == null || password.trim().equals("")) {
			error += "Inserisci Password <br>";
		} else {
			request.setAttribute("password", password);
		}
		
		if(nome == null || nome.trim().equals("")) {
			error += "Inserisci Nome <br>";
		} else {
			request.setAttribute("nome", nome);
		}
		
		if(cognome == null || cognome.trim().equals("")) {
			error += "Inserisci Cognome <br>";
		} else {
			request.setAttribute("cognome", cognome);
		}
		
		if(email == null || email.trim().equals("")) {
			error += "Inserisci Email <br>";
		} else {
			request.setAttribute("email", email);
		}
		
		if(citta == null || citta.trim().equals("")) {
			error += "Inserisci Città <br>";
		} else {
			request.setAttribute("citta", citta);
		}
		
		if(indirizzo == null || indirizzo.trim().equals("")) {
			error += "Inserisci Indirizzo <br>";
		} else {
			request.setAttribute("indirizzo", indirizzo);
		}
		
		if(dataDiNascita == null) {
			error += "Inserisci Data Di Nascita <br>";
		} else {
			request.setAttribute("dataDiNascita", dataDiNascita);
		}
		
		
		if(CF == null || CF.trim().equals("")) {
			error += "Inserisci Codice Fiscale <br>";
		} else {
			request.setAttribute("CF", CF);
		}
		
		if(error == null || !error.trim().equals("")) {
			request.setAttribute("error", error);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/registrazione.jsp");
			dispatcher.forward(request, response);
			return;
		}
		
		UtenteBean utente = new UtenteBean(CF, nome, cognome, username, password, email, citta, indirizzo, dataDiNascita);
		
		try {
			flag = model.alreadyExists(utente);
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		if(flag) {
			try {
				model.doSave(utente);
				System.out.println("success");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/success.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("fail");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/failReg.jsp");
			dispatcher.forward(request, response);
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	public  Date setData(HttpServletRequest request)  {
		String startDateStr = request.getParameter("dataDiNascita");
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date parsed = null;
		try {
			parsed = sdf.parse(startDateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date sqlDate = new Date(parsed.getTime());
		return sqlDate;
		
		
	}

}
