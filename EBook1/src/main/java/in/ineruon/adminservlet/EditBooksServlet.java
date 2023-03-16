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
import in.ineuron.entity.BookDtls;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id =Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String status = req.getParameter("status");
			
			BookDtls b= new BookDtls();
			b.setBookId(id);
			b.setBookname(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			BookDaoImpl doa= new BookDaoImpl(DBconnect.getCon());
			boolean f =doa.updateEditBooks(b);
			HttpSession session = req.getSession();
			
			if(f) {
				
				session.setAttribute("success", "Book Update Successfully.");
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
