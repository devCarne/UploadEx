package paging;

import dao.BookProductDAO;
import dto.BookProductDTO;
import lombok.Data;

import java.util.ArrayList;

@Data
public class ProductPaging {

    private final int OBJ_PER_PAGE = 5;
    private int objectQuantity;
    private int pageQuantity;

    public ProductPaging() {
        BookProductDAO dao = new BookProductDAO();
        ArrayList<BookProductDTO> list = dao.getList();

        objectQuantity = list.size();
        pageQuantity = (objectQuantity / OBJ_PER_PAGE) + 1;
    }
}
