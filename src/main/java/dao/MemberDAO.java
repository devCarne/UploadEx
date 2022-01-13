package dao;

import dto.MemberDTO;

import java.sql.*;
import java.util.ArrayList;

public class MemberDAO implements IMemberDAO {
    @Override
    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.OracleDriver");
        return DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    }

    @Override
    public int registMember(MemberDTO member) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO D_MEMBER VALUES (?, ?, ?)";
        PreparedStatement pstmt = getConnection().prepareStatement(sql);
        pstmt.setString(1, member.getId());
        pstmt.setString(2, member.getPw());
        pstmt.setString(3, member.getName());
        pstmt.executeUpdate();

        return Integer.parseInt(member.getId());
    }

    @Override
    public int updateMember(MemberDTO member) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE D_MEMBER ID = ?, PW =?, NAME =? WHERE ID = ?";
        PreparedStatement pstmt = getConnection().prepareStatement(sql);
        pstmt.setString(1, member.getId());
        pstmt.setString(2, member.getPw());
        pstmt.setString(3, member.getName());
        pstmt.setString(4, member.getId());
        pstmt.executeUpdate();

        return Integer.parseInt(member.getId());
    }

    @Override
    public ArrayList<MemberDTO> getList() throws SQLException, ClassNotFoundException {
        String sql ="SELECT * FROM D_MEMBER";
        Statement statement = getConnection().createStatement();

        ArrayList<MemberDTO> members = new ArrayList<>();
        ResultSet rs = statement.executeQuery(sql);
        while (rs.next()) {
            MemberDTO member = new MemberDTO();
            member.setId(rs.getString("ID"));
            member.setPw(rs.getString("PW"));
            member.setName(rs.getString("NAME"));
            members.add(member);
        }
        return members;
    }

    @Override
    public void deleteMember(String id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM D_MEMBER WHERE ID = " + id;

        Statement statement = getConnection().createStatement();
        statement.executeUpdate(sql);
    }

    @Override
    public int checkLogin(String id, String pw) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM D_MEMBER WHERE ID = " + id + " PW = " + pw;

        Statement statement = getConnection().createStatement();
        ResultSet rs = statement.executeQuery(sql);

        rs.next();
        return Integer.parseInt(rs.getString("ID"));
    }
}
