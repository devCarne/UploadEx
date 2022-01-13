package dao;

import dto.BookProductDTO;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface IBookProductDAO {

    Connection getConnection() throws ClassNotFoundException, SQLException;

    boolean insert(BookProductDTO book);

    BookProductDTO select(String code) throws SQLException, ClassNotFoundException;

    boolean update(BookProductDTO book) throws SQLException, ClassNotFoundException;

    ArrayList<BookProductDTO> getList() throws SQLException, ClassNotFoundException;

    boolean delete(String bookCode) throws SQLException, ClassNotFoundException;
}
