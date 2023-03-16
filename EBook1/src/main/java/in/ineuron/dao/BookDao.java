package in.ineuron.dao;

import java.util.List;

import in.ineuron.entity.BookDtls;

public interface BookDao {

	public boolean addBooks(BookDtls b);
	
	public List<BookDtls> getAllBooks();
	
	public BookDtls getBookById(int Id);
	
	public boolean updateEditBooks(BookDtls b);
	
	public boolean deleteBooks(int id);
	 
	public List<BookDtls> getNewBook();
	
	public List<BookDtls> getRecentBooks();
	
	public List<BookDtls> getOldBooks();
	
	public List<BookDtls> getAllRecentBook();
	
	public List<BookDtls> getAllNewBook();
	
	public List<BookDtls> getAllOldBook();
	
}
