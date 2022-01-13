package controller;

import dao.BookProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/deleteQuery")
public class DeleteQuery extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        BookProductDAO dao = new BookProductDAO();
        PrintWriter out = resp.getWriter();

        String code = req.getParameter("delCode");
        System.out.println(code);
        try {
            dao.delete(code);
            out.println("<script>alert('상품 삭제가 완료되었습니다.'); location.href='productList.jsp';</script>");
            out.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
