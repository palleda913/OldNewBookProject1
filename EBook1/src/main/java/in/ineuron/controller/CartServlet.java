package in.ineuron.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.ineuron.dao.BookDaoImpl;
import in.ineuron.dao.CartDaoImpl;
import in.ineuron.db.DBconnect;
import in.ineuron.entity.BookDtls;
import in.ineuron.entity.Cart;
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BookDaoImpl dao=new BookDaoImpl(DBconnect.getCon());
			BookDtls b=dao.getBookById(bid);
			Cart c=new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookName(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			 CartDaoImpl dao2=new CartDaoImpl(DBconnect.getCon());
			 boolean f=dao2.addCart(c);
			 
			 HttpSession session=req.getSession();
			 
			 
			 
			 
			 if(f) {
				 session.setAttribute("addCart", "Added Succesfully");
				 resp.sendRedirect("all_new_book.jsp");
			 }else {
				 session.setAttribute("failure", "Added Succesfully");
				 resp.sendRedirect("all_new_book.jsp"); 
			 }
			 
			 
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
}
