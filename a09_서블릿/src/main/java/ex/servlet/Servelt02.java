package ex.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Servelt02")
public class Servelt02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Servelt02() {
        super();
    }

    public void init(ServletConfig config) throws ServletException{
    	System.out.println("init() 실행");
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service() 실행");
		super.service(request, response);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 실행");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 실행");
	}
	
	public void destroy() {
		System.out.println("destroy() 실행");
	}

}
