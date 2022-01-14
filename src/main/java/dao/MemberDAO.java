package dao;

import dto.MemberDTO;

import java.sql.*;

public class MemberDAO implements IMemberDAO {
    @Override
    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.OracleDriver");
        return DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    }

    @Override
    public MemberDTO login(String id, String pw) {

        String sql = "SELECT * FROM TBL_MEMBER WHERE ID = '" + id + "'";
        try(Statement statement = getConnection().createStatement(); ResultSet rs = statement.executeQuery(sql)){
            rs.next();
            return new MemberDTO(rs.getString("ID"), rs.getString("PW"), rs.getString("NAME"));
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        }
    }

    @Override
    public boolean insert(MemberDTO member) {
        String sql = "INSERT INTO TBL_MEMBER VALUES (?, ?, ?)";
        try(PreparedStatement ps = getConnection().prepareStatement(sql)){
            ps.setString(1, member.getId());
            ps.setString(2, member.getPw());
            ps.setString(3, member.getName());
            ps.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public MemberDTO select(String id) {

        String sql = "SELECT * FROM TBL_MEMBER WHERE ID = '" + id + "'";

        try (Statement statement = getConnection().createStatement(); ResultSet rs = statement.executeQuery(sql)){

            rs.next();
            MemberDTO member = new MemberDTO();
            member.setId(rs.getString("ID"));
            member.setPw(rs.getString("PW"));
            member.setName(rs.getString("NAME"));

            return member;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
//
//    @Override
//    public int updateMember(MemberDTO member) throws SQLException, ClassNotFoundException {
//        String sql = "UPDATE D_MEMBER ID = ?, PW =?, NAME =? WHERE ID = ?";
//        PreparedStatement pstmt = getConnection().prepareStatement(sql);
//        pstmt.setString(1, member.getId());
//        pstmt.setString(2, member.getPw());
//        pstmt.setString(3, member.getName());
//        pstmt.setString(4, member.getId());
//        pstmt.executeUpdate();
//
//        return Integer.parseInt(member.getId());
//    }
//
//    @Override
//    public ArrayList<MemberDTO> getList() throws SQLException, ClassNotFoundException {
//        String sql ="SELECT * FROM D_MEMBER";
//        Statement statement = getConnection().createStatement();
//
//        ArrayList<MemberDTO> members = new ArrayList<>();
//        ResultSet rs = statement.executeQuery(sql);
//        while (rs.next()) {
//            MemberDTO member = new MemberDTO();
//            member.setId(rs.getString("ID"));
//            member.setPw(rs.getString("PW"));
//            member.setName(rs.getString("NAME"));
//            members.add(member);
//        }
//        return members;
//    }
//
//    @Override
//    public void deleteMember(String id) throws SQLException, ClassNotFoundException {
//        String sql = "DELETE FROM D_MEMBER WHERE ID = " + id;
//
//        Statement statement = getConnection().createStatement();
//        statement.executeUpdate(sql);
//    }
//
//    @Override
//    public int checkLogin(String id, String pw) throws SQLException, ClassNotFoundException {
//        String sql = "SELECT * FROM D_MEMBER WHERE ID = " + id + " PW = " + pw;
//
//        Statement statement = getConnection().createStatement();
//        ResultSet rs = statement.executeQuery(sql);
//
//        rs.next();
//        return Integer.parseInt(rs.getString("ID"));
//    }
}
