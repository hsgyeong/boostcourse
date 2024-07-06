package kr.or.connect.daoexam.dao;

public class RoleDaoSqls {
	public static final String SELECT_ALL = "SELECT role_id, description FROM role order by role_id";
	public static final String UPDATE = "UPDATE role set description = :description where role_id = :roleId";
													//쿼리문을 적을때 *로 적는 것보다 컬럼명을 정확하게 나열해서 사용하는 것이 좋다. 
	public static final String SELECT_BY_ROLE_ID = "SELECT role_id, description FROM role where role_id = :roleId";														
	public static final String DELETE_BY_ROLE_ID = "DELETE FROM role WHERE role_id = :roleId";
																					//: 실행시 파라미터로 바인딩 할 값	
}
