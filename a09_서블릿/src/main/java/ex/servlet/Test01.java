package ex.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class Test01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Test01() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/forward")) {
			String name = request.getParameter("name");
			request.setAttribute("name", name);
			request.getRequestDispatcher("test02.jsp").forward(request, response);
		}else if(com.equals("/redirect")) {
			String name = request.getParameter("name");
			request.setAttribute("name", name);
			response.sendRedirect("test02.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
