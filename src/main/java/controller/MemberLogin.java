package controller;

import dao.AdminDAO;
import dao.MemberDAO;
import dto.AdminDTO;
import dto.MemberDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/memberLogin")
public class MemberLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();

        MemberDAO dao = new MemberDAO();

        String paramID = req.getParameter("memberID");
        String paramPW = req.getParameter("memberPW");
        MemberDTO member = dao.login(paramID, paramPW);

        if (member == null) {
            out.print("<script>alert('아이디가 잘못되었습니다.'); history.go(-1);</script>");
        } else if (!member.getPw().equals(paramPW)) {
            out.print("<script>alert('비밀번호가 잘못되었습니다.'); history.go(-1);</script>");
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("grade", "회원");
            session.setAttribute("userID", member.getId());
            session.setAttribute("userName", member.getName());
            resp.sendRedirect("memberMain.jsp");
        }
    }
}
