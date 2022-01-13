package controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dao.BookProductDAO;
import dto.BookProductDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/updateQuery")
public class ProductUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        BookProductDAO dao = new BookProductDAO();

        String filePath = getServletContext().getRealPath("images");
        MultipartRequest multi = new MultipartRequest(req, filePath, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
        String fileName = multi.getFilesystemName("changeImage");

        if (fileName == null) { fileName = multi.getParameter("originImage").replace("images/", "");}

        BookProductDTO book = new BookProductDTO(
                multi.getParameter("code"),
                multi.getParameter("name"),
                Integer.parseInt(multi.getParameter("price")),
                multi.getParameter("author"),
                multi.getParameter("publisher"),
                multi.getParameter("info"),
                "images/" + fileName
        );

        try {
            dao.update(book);
            out.println("<script>alert('상품 변경이 완료되었습니다.'); location.href='index.jsp';</script>");
            out.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
