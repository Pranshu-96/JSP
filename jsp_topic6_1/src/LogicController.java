

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Authenticator;
import bean.user;

/**
 * Servlet implementation class LogicController
 */
@WebServlet("/LogicController")
public class LogicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		user u=new user();
		u.setUsername(username);
		u.setPassword(password);
		Authenticator a=new Authenticator();
		String h=a.check(u);
		RequestDispatcher rd=request.getRequestDispatcher(h);
		rd.forward(request, response);
	}

	

}
