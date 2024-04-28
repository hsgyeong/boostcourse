package kr.or.connect.todolist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.connect.todolist.dto.TodoDto;

public class TodoDao {
	private static String dburl = "jdbc:mysql://localhost:3306/connectdb";
	private static String dbUser = "connectuser";
	private static String dbpasswd = "connect123!@#";

	public void addTodo(TodoDto dto) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			String sql = "INSERT INTO todo(title, name, sequence) values('오늘의 산책 계획', '김도리', 1)";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getName());
			ps.setInt(3, dto.getSequence());
			ps.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					
				}
			}
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
				
				}
			}
		}
	}
	
	public List<TodoDto> getTodo() {
		List<TodoDto> list = new ArrayList<>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String sql = "select id, title, name, sequence, type, regdate from todo order by regdate desc select id, title, name, sequence, type, regdate from todo where type='TODO' order by regdate desc";
		
		try(Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			PreparedStatement ps = conn.prepareStatement(sql)){
			
			try(ResultSet rs = ps.executeQuery()){
				while(rs.next()) {
				int sequence = rs.getInt("sequence");
				int id = rs.getInt("id");
				TodoDto dto = new TodoDto(sequence, id);
				list.add(dto);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
}
