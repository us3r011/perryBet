package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.EventoBean;
import model.EventoModel;

/**
 * Servlet implementation class EventoServlet
 */
@WebServlet("/EventoServlet")
public class EventoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EventoModel model = new EventoModel();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EventoBean bean = new EventoBean();
		
		
		
		bean.setPalinsesto((String)request.getParameter("palinsesto"));
		bean.setEvento((String)request.getParameter("evento"));
		bean.setData(setData(request));
		bean.setSquadraCasa((String)request.getParameter("squadraCasa"));
		bean.setSquadraTrasferta((String)request.getParameter("squadraTrasferta"));
		bean.setQuota1((String) request.getParameter("quota1"));
		bean.setQuotaX((String) request.getParameter("quotaX"));
		bean.setQuota2((String) request.getParameter("quota2"));
		
		try {
			model.aggiungiEvento(bean);
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public  Date setData(HttpServletRequest request)  {
		String startDateStr = request.getParameter("data");
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
