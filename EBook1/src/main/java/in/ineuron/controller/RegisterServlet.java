package in.ineuron.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.ineuron.dao.UserDaoImpl;
import in.ineuron.db.DBconnect;
import in.ineuron.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check= req.getParameter("check");
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session= req.getSession();
			
			if(check!=null) 
			{
				UserDaoImpl dao=new UserDaoImpl(DBconnect.getCon());
				boolean f=dao.userRegister(us);
				
				
				if(f) {
					//System.out.println("User Register Success....");
					session.setAttribute("success","Registration Succuesfully");
					resp.sendRedirect("register.jsp");
				
				}else {
					
					session.setAttribute("failure","something went wrong");
					resp.sendRedirect("register.jsp");
					//System.out.println("something went wrong...");
				}
				
			}else {
				session.setAttribute("failure","please accept Terms & Conditions");
				resp.sendRedirect("register.jsp");
				//System.out.println("please accept Terms & Conditions");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

	
	
	
}
