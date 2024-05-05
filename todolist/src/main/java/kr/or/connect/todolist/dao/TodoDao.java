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
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			String sql = "INSERT INTO todo(title, name, sequence, regdate) values(?,?,?,now())";
			
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
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String sql = "SELECT id, title, name, sequence, type, regdate FROM todo ORDER BY regdate DESC";
		
		try(Connection conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			PreparedStatement ps = conn.prepareStatement(sql)){
			
			try(ResultSet rs = ps.executeQuery()){
				while(rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String name = rs.getString("name");
				int sequence = rs.getInt("sequence");
				String type = rs.getString("type");
				String regdate = rs.getString("regdate");
				
				TodoDto dto = new TodoDto();
				
				dto.setId(id);
				dto.setTitle(title);
				dto.setName(name);
				dto.setSequence(sequence);
				dto.setType(type);
				dto.setRegDate(regdate);
				
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
	
	public void updateTodo(TodoDto dto) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			
			String type;
			
			if(dto.getType().equals("TODO")) {
				type = "DOING";
			}else if(dto.getType().equals("DOING")) {
				type = "DONE";
			}else{
				return;
			}
			
			String sql = "UPDATE todo SET type = ? where id = ?"; 
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, type);
			ps.setLong(2, dto.getId());
			
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

	
}
