package member2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import member2.MybatisConnector;
import jdbc.JdbcUtil;


public class JoinDBMybatis extends MybatisConnector{
	//mybatis namespace
	private final String namespace = "ldg.mybatis";	
	
	//Singleton : getInstance
		private static JoinDBMybatis instance = new JoinDBMybatis();
		public static JoinDBMybatis getInstance() {
			return instance;
		}
		private JoinDBMybatis() {	
		}
	//SqlSession	
		SqlSession sqlSession;
			
		//getMembers
		public List getMembers(int startRow, int endRow) {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			List li = sqlSession.selectList(namespace+".getMembers",map);
			sqlSession.close();

			return li;
		}

		//getMemberCount
		public int getMemberCount(){
			int x=0;
			int number = 0;
			sqlSession = sqlSession();
			x=sqlSession.selectOne(namespace+".getMemberCount");
			sqlSession.close();
			
			return x;
		}
		
		//getMember
		public JoinDataBean getMember(String id) {

			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("id", id);
			JoinDataBean member = sqlSession.selectOne(namespace+".getMember",map);
			//sqlSession.commit(); //update가 있으니까 commit!
			sqlSession.close();
			return member;
		}
	
	/*private Date toDate(Timestamp date) {
		return date == null?null:new Date(date.getTime());
	}*/
	
	//login
		public int login(String id, String pwd) {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("id", id);
			map.put("pwd", pwd);
			int chk = sqlSession.selectOne(namespace+".login", map);
			/*return chk;*/
			
			if(id.equals(pwd)) {
					
					return 1;	//로그인 성공
			}else {
				System.out.println("불일치");
					return 0;	//비밀번호 불일치
				}
			
		/*System.out.println("아이디 없다");
			
			return -1; //아이디가 없다

			return -2; //데이터베이스 오류
*/			
		/*	sqlSession.close();*/


}
/*    public int login(String userid, String passwd) {
			      sqlSession = sqlSession();
			      Map<String,String> map = new HashMap<String,String>();
			      map.put("userid", userid);
			      map.put("passwd", passwd);
			      int chk=0;
			      
			      Map<String,String> map2=sqlSession.selectOne(namespace+".login", map);
			      
			      if (map2!=null && map2.containsValue(passwd)) {
			         chk=1;
			         sqlSession.close();
			         return chk;
			      }

			      if (map2!=null) {
			         chk=0;
			         sqlSession.close();
			         return chk;
			      }else {
			         chk=-1;
			         sqlSession.close();
			         return chk;
			      }
			   
			   }*/
		
		
		
	//insert
		public void insertData(JoinDataBean info) {
			sqlSession = sqlSession();
			/*int number = sqlSession.selectOne(namespace+".getNextNumber", info);
			//number=number+1;이게 정상적인 번호 증가 방식은 아님. 
			//ORACLE DB에 select boardser.nextval from dual;를 넣어서 자동증가하도록 해야함.
*/						
				sqlSession.insert(namespace+".insertData", info);
				sqlSession.commit();
				sqlSession.close();
		}	
	
		//아이디 중복체크
		public boolean confirmId(String id) {
			sqlSession = sqlSession();
			boolean result = false;
			
			Map map = new HashMap();
			map.put("id", id);
			Map map2 = sqlSession.selectOne(namespace+".confirmId", map);
			
			if(map2!=null) {
				result=true;
			}
			sqlSession.close();
			return result;
		}
	    
		
		//update  
		public int updateData(JoinDataBean info) {
			
			sqlSession = sqlSession();
			int chk = sqlSession.update(namespace+".updateData", info);
			sqlSession.commit(); 
			sqlSession.close();
			
			return chk;

		}
		/*
		//****delete
		public int deleteData(String id, String pwd, String admin)throws Exception{
			
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("id", id);
			map.put("pwd", pwd);
			map.put("admin", admin);
			int chk = sqlSession.delete(namespace+".deleteData", map);
			sqlSession.commit(); 
			sqlSession.close();
			return chk;
			
			int x = -1;
			
			if(admin.equals("admin")) {
				String sql = "delete from member where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);				
			}
			else {
			String sql = "delete from member where id=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd); }
		
		}*/

}
