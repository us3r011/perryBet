package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class LoggedFilter
 */
@WebFilter("/LoggedFilter")
public class LoggedFilter implements Filter {
	FilterConfig filterConfig;

    /**
     * Default constructor. 
     */
    public LoggedFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		Object log=((HttpServletRequest)request).getSession().getAttribute("logged");
		if(log==null) {
			System.out.println("nel filtro logged � null");
			//((HttpServletResponse)response).sendRedirect("/login.jsp");
			RequestDispatcher dispatcher=filterConfig.getServletContext().getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}else {
			boolean logged= (boolean)log;
			System.out.println("sono un filtro, logged: "+ logged);
			if(!logged) {
				System.out.println("logged");
				//((HttpServletResponse)response).sendRedirect("/UfficioPostale2/login.jsp");
				RequestDispatcher dispatcher=filterConfig.getServletContext().getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
				
			}
		}
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		filterConfig=fConfig;
	}

}
