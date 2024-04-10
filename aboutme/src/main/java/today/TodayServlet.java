package today;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/today")
public class TodayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public TodayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter sdf = DateTimeFormatter.ofPattern("yyyy/MM/dd hh:mm");
		String date = sdf.format(now);
		
		out.print("<a onclick=location.href='index.html' style=\"cursor:pointer; text-decoration:underline; color:purple\">메인화면</a>");
		out.print("<span style=\"display:flex;justify-content:center;margin-top:300px;\">"
				+ "<h1>현재시간 : </h1>&nbsp;"+"<h1>"+date+"</h1></span>");
	}

}
