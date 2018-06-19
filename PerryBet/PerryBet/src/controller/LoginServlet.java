package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UtenteBean;
import model.UtenteModel;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	static UtenteModel model = new UtenteModel();
	
    public LoginServlet() {
        super();
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = "";
		UtenteBean utente = new UtenteBean();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(username == null || username.trim().equals("")) {
			error += "Inserisci Username <br>";
		} else {
			request.setAttribute("username", username);
		}
		
		if(password == null || password.trim().equals("")) {
			error += "Inserisci Password <br>";
		}
		
		try {
			utente = model.checkUser(username, password);
			
			boolean logged = true;
			if(utente.getCF() != null) {
			
				request.getSession().setAttribute("logged", logged);
				request.getSession().setAttribute("utente", utente);
				HttpSession session = request.getSession();

				if(logged) {
					synchronized (session) {
						request.getSession().setAttribute("username", utente.getUser());
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserServlet");
						dispatcher.forward(request, response);
			
					}
				}
			} else {
			
				error = "Invalid username and password";
				request.setAttribute("error", error);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fail.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
