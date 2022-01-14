package controller;

import dao.MemberDAO;
import dto.MemberDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/memberInsert")
public class MemberInsert extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();

        MemberDTO member = new MemberDTO(req.getParameter("id"), req.getParameter("pw"), req.getParameter("name"));

        MemberDAO dao = new MemberDAO();
        dao.insert(member);

        out.println("<script>alert('회원 등록이 완료되었습니다.'); location.href='index.jsp';</script>");
        out.close();
    }
}
