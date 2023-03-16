package in.ineruon.adminservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.ineuron.dao.BookDaoImpl;
import in.ineuron.db.DBconnect;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			BookDaoImpl dao = new BookDaoImpl(DBconnect.getCon());
			boolean f=dao.deleteBooks(id);
			
			HttpSession session = req.getSession();
			
			if(f) {
				
				session.setAttribute("success", "Book Delete Successfully.");
				resp.sendRedirect("admin/all_books.jsp");
			}else {
				session.setAttribute("failure", "something went wrong.");
				resp.sendRedirect("admin/all_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	

	
	
	
}
