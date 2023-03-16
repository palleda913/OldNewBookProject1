package in.ineuron.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.ineuron.dao.CartDaoImpl;
import in.ineuron.db.DBconnect;
@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bid=Integer.parseInt(req.getParameter("bid"));
		CartDaoImpl dao=new CartDaoImpl(DBconnect.getCon());
		boolean f=dao.deleteBook(bid);
		HttpSession session =req.getSession();
		
		if(f) {
			session.setAttribute("success", "Book Remove from cart");
			resp.sendRedirect("checkout.jsp");
		}else {
			
			session.setAttribute("failure", "some thing wrong");
			resp.sendRedirect("checkout.jsp");
		}
		
		
		try {
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	
	

}
