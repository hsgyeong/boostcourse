package kr.or.connect.todolist.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.connect.todolist.dao.TodoDao;
import kr.or.connect.todolist.dto.TodoDto;


@WebServlet("/todolist/*")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MainServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		TodoDao dao = new TodoDao();
		
		List<TodoDto> list = dao.getTodo();
		
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(list);
		
		PrintWriter out = response.getWriter();
		out.println(json);
		out.close();
		
	}

}
