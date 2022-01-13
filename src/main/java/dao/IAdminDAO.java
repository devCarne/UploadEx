package dao;

import dto.AdminDTO;

import java.sql.Connection;
import java.sql.SQLException;

public interface IAdminDAO {
    Connection getConnection() throws ClassNotFoundException, SQLException;

    AdminDTO login(String id, String pw);

    boolean insert(AdminDTO admin);
}
