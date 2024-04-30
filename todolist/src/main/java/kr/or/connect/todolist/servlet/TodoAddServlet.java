package kr.or.connect.todolist.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.connect.todolist.dao.TodoDao;
import kr.or.connect.todolist.dto.TodoDto;


@WebServlet("/todo")
public class TodoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public TodoAddServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/todoForm.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String sequence = request.getParameter("sequence");
		String type = request.getParameter("type");
		String regdate = request.getParameter("regdate");
		
		TodoDto todoDto = new TodoDto();
		todoDto.setTitle(title);
		todoDto.setName(name);
		todoDto.setSequence(Integer.parseInt(sequence));
		todoDto.setType(type);
		todoDto.setRegDate(regdate);
	
		TodoDao todoDao = new TodoDao();   
		todoDao.addTodo(todoDto);
		
		response.sendRedirect("todolist");
		
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
