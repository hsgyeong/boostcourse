package kr.or.connect.todolist.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.connect.todolist.dao.TodoDao;

@WebServlet("/type")
public class TodoTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public TodoTypeServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		TodoDao todoDao = new TodoDao();
		String type = request.getParameter("type");
		Long id = Long.parseLong((String)request.getParameter("id"));
		
		System.out.println(type);
		System.out.println(id);
		
		todoDao.updateTodo(type, id);
	
		
	}

}
