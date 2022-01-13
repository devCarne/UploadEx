package controller;

import dao.AdminDAO;
import dto.AdminDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/adminInsert")
public class AdminInsert extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();

        AdminDTO admin = new AdminDTO(req.getParameter("id"), req.getParameter("pw"), req.getParameter("name"));

        AdminDAO dao = new AdminDAO();
        dao.insert(admin);

        out.println("<script>alert('관리자 등록이 완료되었습니다.'); location.href='adminMain.jsp';</script>");
        out.close();
    }
}
