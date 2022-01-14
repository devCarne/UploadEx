package dao;

import dto.MemberDTO;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface IMemberDAO {
//    1.DB접속 2.회원등록 3.회원정보수정 4.회원정보조회(전체) 5.회원정보삭제 6.로그인

    Connection getConnection() throws ClassNotFoundException, SQLException;

    MemberDTO login(String id, String pw);

    boolean insert(MemberDTO member) throws SQLException, ClassNotFoundException;

    MemberDTO select(String id);

//    int updateMember(MemberDTO member) throws SQLException, ClassNotFoundException;
//
//    ArrayList<MemberDTO> getList() throws SQLException, ClassNotFoundException;
//
//    void deleteMember(String id) throws SQLException, ClassNotFoundException;
//
//    int checkLogin(String id, String pw) throws SQLException, ClassNotFoundException;

}
