package in.ineruon.adminservlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import in.ineuron.dao.BookDaoImpl;
import in.ineuron.db.DBconnect;
import in.ineuron.entity.BookDtls;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String filename = part.getSubmittedFileName();

			BookDtls b = new BookDtls(bookName, author, price, categories, status, filename, "admin");

			BookDaoImpl doa = new BookDaoImpl(DBconnect.getCon());

			

			boolean f=doa.addBooks(b);
			HttpSession session =req.getSession();
			if(f) {
				String path = getServletContext().getRealPath("") + "book";

				File file = new File(path);
				part.write(path + File.pathSeparator + filename);
				
				
				
				
				session.setAttribute("success", "Book added suceesfully");
				resp.sendRedirect("admin/add_books.jsp");
				
			}else {
				session.setAttribute("failure", "Something went wrong");
				resp.sendRedirect("admin/add_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

}
