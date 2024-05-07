package kr.or.connect.todolist.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import kr.or.connect.todolist.dto.TodoDto;

public class TodoDao {
	private static String dburl = "jdbc:mysql://localhost:3306/connectdb";
	private static String dbUser = "connectuser";
	private static String dbpasswd = "connect123!@#";

	public int addTodo(String title, String name, int sequence) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		int insertCount = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			String sql = "INSERT INTO todo(title, name, sequence) values(?,?,?)";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, title);
			ps.setString(2, name);
			ps.setInt(3, sequence);
			
			insertCount = ps.executeUpdate();
			
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
			return insertCount;
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
				Long id = rs.getLong("id");
				String title = rs.getString("title");
				String name = rs.getString("name");
				int sequence = rs.getInt("sequence");
				String type = rs.getString("type");
				String regDate = rs.getString("regdate");
				
				TodoDto dto = new TodoDto();
				
				dto.setId(id);
				dto.setTitle(title);
				dto.setName(name);
				dto.setSequence(sequence);
				dto.setType(type);
				dto.setRegDate(regDate);
				
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
	
	public int updateTodo(String type, Long id) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		int updateCount = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			conn = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			
			String sql = "UPDATE todo SET type = ? WHERE id = ?"; 
			
			String nextType = null;
			if(type.equals("TODO"))
				nextType = "DOING";
			else if(type.equals("DOING")) 
				nextType = "DONE";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, nextType);
			ps.setLong(2, id);
			
			updateCount = ps.executeUpdate();
			
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
		return updateCount;
	}

}
