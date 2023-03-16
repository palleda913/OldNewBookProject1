package in.ineuron.dao;

import java.util.List;

import in.ineuron.entity.BookDtls;
import in.ineuron.entity.Cart;

public interface CartDao {

	public boolean addCart( Cart c);
	
	public List<Cart> getBookByUser(int uid);
	
	public boolean deleteBook(int bid);
	
	
	
}
