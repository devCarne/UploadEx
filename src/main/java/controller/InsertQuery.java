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

@WebServlet("/insertQuery")
public class InsertQuery extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        String filePath = getServletContext().getRealPath("images");
        MultipartRequest multi = new MultipartRequest(request, filePath, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
        String fileName = multi.getFilesystemName("image");

        BookProductDTO book = new BookProductDTO(
                multi.getParameter("code"),
                multi.getParameter("name"),
                Integer.parseInt(multi.getParameter("price")),
                multi.getParameter("author"),
                multi.getParameter("publisher"),
                multi.getParameter("info"),
                "images/" + fileName
        );

        BookProductDAO dao = new BookProductDAO();
        dao.insert(book);

        out.println("<script>alert('상품 등록이 완료되었습니다.'); location.href='index.jsp';</script>");
        out.close();
    }
}
