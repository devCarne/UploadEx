package dao;

import dto.BookProductDTO;

import java.sql.*;
import java.util.ArrayList;

public class BookProductDAO implements IBookProductDAO {
    @Override
    public Connection getConnection() throws ClassNotFoundException, SQLException {

        Class.forName("oracle.jdbc.OracleDriver");

        return DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    }

    @Override
    public boolean insert(BookProductDTO book)  {

        String sql = "INSERT INTO PRODUCT_BOOK VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = getConnection().prepareStatement(sql)){

            ps.setString(1, book.getCode());
            ps.setString(2, book.getName());
            ps.setInt(3, book.getPrice());
            ps.setString(4, book.getAuthor());
            ps.setString(5, book.getPublisher());
            ps.setString(6, book.getInfo());
            ps.setString(7, book.getImage());

            ps.executeUpdate();

            return true;

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

            return false;
        }
    }

    @Override
    public BookProductDTO select(String code) throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM PRODUCT_BOOK WHERE CODE = '" + code + "'";

        try (Statement statement = getConnection().createStatement(); ResultSet rs = statement.executeQuery(sql)){

            rs.next();
            BookProductDTO book = new BookProductDTO();
            book.setCode(rs.getString("CODE"));
            book.setName(rs.getString("NAME"));
            book.setPrice(rs.getInt("PRICE"));
            book.setAuthor(rs.getString("AUTHOR"));
            book.setPublisher(rs.getString("PUBLISHER"));
            book.setInfo(rs.getString("INFO"));
            book.setImage(rs.getString("IMAGE"));

            return book;
        }
    }
    @Override
    public boolean update(BookProductDTO book) throws SQLException, ClassNotFoundException {

        String sql = "UPDATE PRODUCT_BOOK SET CODE=?, NAME=?, PRICE=?, AUTHOR=?, PUBLISHER=?, INFO=?, IMAGE=? WHERE CODE=?";

        try (PreparedStatement ps = getConnection().prepareStatement(sql)) {

            ps.setString(1, book.getCode());
            ps.setString(2, book.getName());
            ps.setInt(3, book.getPrice());
            ps.setString(4, book.getAuthor());
            ps.setString(5, book.getPublisher());
            ps.setString(6, book.getInfo());
            ps.setString(7, book.getImage());
            ps.setString(8, book.getCode());

            ps.executeUpdate();
            return true;
        }
    }

    @Override
    public ArrayList<BookProductDTO> getList() throws SQLException, ClassNotFoundException {

        String sql = "SELECT * FROM PRODUCT_BOOK";

        try(Statement statement = getConnection().createStatement(); ResultSet rs = statement.executeQuery(sql)) {

            ArrayList<BookProductDTO> books = new ArrayList<>();

            while (rs.next()) {
                BookProductDTO book = new BookProductDTO();

                book.setCode(rs.getString("CODE"));
                book.setName(rs.getString("NAME"));
                book.setPrice(rs.getInt("PRICE"));
                book.setAuthor(rs.getString("AUTHOR"));
                book.setPublisher(rs.getString("PUBLISHER"));
                book.setInfo(rs.getString("INFO"));
                book.setImage(rs.getString("IMAGE"));

                books.add(book);
            }
            return books;
        }
    }

    @Override
    public boolean delete(String bookCode) throws SQLException, ClassNotFoundException {

        String sql = "DELETE FROM PRODUCT_BOOK WHERE CODE = '" + bookCode + "'";

        try (Statement statement = getConnection().createStatement()){

            statement.executeUpdate(sql);

            return true;
        }
    }
}
