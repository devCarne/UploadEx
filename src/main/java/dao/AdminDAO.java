package dao;

import dto.AdminDTO;

import java.sql.*;

public class AdminDAO implements IAdminDAO {

    @Override
    public Connection getConnection() throws ClassNotFoundException, SQLException {

        Class.forName("oracle.jdbc.OracleDriver");

        return DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    }

    @Override
    public AdminDTO login(String id, String pw) {

        String sql = "SELECT * FROM TBL_ADMIN WHERE ID = '" + id + "'";
        try(Statement statement = getConnection().createStatement(); ResultSet rs = statement.executeQuery(sql)){
            rs.next();
            return new AdminDTO(rs.getString("ID"), rs.getString("PW"), rs.getString("NAME"));
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        }
    }

    @Override
    public boolean insert(AdminDTO admin) {
        String sql = "INSERT INTO TBL_ADMIN VALUES (?, ?, ?)";

        try (PreparedStatement ps = getConnection().prepareStatement(sql)){

            ps.setString(1, admin.getId());
            ps.setString(2, admin.getPw());
            ps.setString(3, admin.getName());

            ps.executeUpdate();

            return true;

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

            return false;
        }
    }
}
