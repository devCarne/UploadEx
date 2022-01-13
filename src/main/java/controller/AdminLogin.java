package controller;

import dao.AdminDAO;
import dto.AdminDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();

        AdminDAO dao = new AdminDAO();

        String paramID = req.getParameter("adminID");
        String paramPW = req.getParameter("adminPW");
        AdminDTO admin = dao.login(paramID, paramPW);

        if (admin == null) {
            out.print("<script>alert('아이디가 잘못되었습니다.'); history.go(-1);</script>");
        } else if (!admin.getPw().equals(paramPW)) {
            out.print("<script>alert('비밀번호가 잘못되었습니다.'); history.go(-1);</script>");
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("grade", "관리자");
            session.setAttribute("userName", admin.getName());
            resp.sendRedirect("adminMain.jsp");
        }
    }
}
