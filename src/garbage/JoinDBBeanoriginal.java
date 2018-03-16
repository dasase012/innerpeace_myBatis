package garbage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jdbc.JdbcUtil;
import member2.JoinDataBean;


public class JoinDBBeanoriginal {

	//Singleton : getInstance
		private static JoinDBBeanoriginal instance = new JoinDBBeanoriginal();
		public static JoinDBBeanoriginal getInstance() {
			return instance;
		}
		private JoinDBBeanoriginal() {	
		}
		
	//Connection method
		public static Connection getConnection(){
			Connection conn = null;
			try {
				/*String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";*/	//	HOME
				String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";  //	SIST
				String dbId = "scott";
				String dbPass = "tiger";
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
						
			}catch(Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
		//close method
		public void close(Connection con, ResultSet rs,PreparedStatement pstmt) {
			if(rs!=null) 
				try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) 
				try {pstmt.close();}catch(SQLException ex) {}
			if(con!=null) 
				try {con.close();}catch(SQLException ex) {}
			}
	
		//getMembers
		public List getMembers(int startRow, int endRow) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List memberList = null;
			String sql="";
			
			try {
				conn = getConnection();
				sql = "select * from " 
						+"(select rownum rnum,a.* "
						+" from (select id,name,pwd,gender,birthdate,tel,email,"
						+ "con_past,con_date,con_cat,position,regdate	"
						+ "from member order by regdate desc) "
						+ " a ) where rnum between ? and ? ";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
				
			if(rs.next()) {
				memberList = new ArrayList();
				do{
					JoinDataBean members = new JoinDataBean();
					members.setId(rs.getString("id"));
					members.setName(rs.getString("name"));
					members.setPwd(rs.getString("pwd"));
					members.setGender(rs.getString("gender"));
					members.setBirthdate(rs.getString("birthdate"));
					members.setTel(rs.getString("tel"));
					members.setEmail(rs.getString("email"));
					members.setCon_past(rs.getString("con_past"));
					members.setCon_date(rs.getString("con_date"));
					members.setCon_cat(rs.getString("con_cat"));
					members.setPosition(rs.getString("position"));
					members.setRegdate(rs.getTimestamp("regdate"));
					memberList.add(members);
				}while(rs.next());}
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				close(conn,rs,pstmt);
			}
			return memberList;
		}

		//getMemberCount
		public int getMemberCount(){
			int x=0;
			String sql="select nvl(count(*),0) from member ";
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int number = 0;
			
			try {
			pstmt=con.prepareStatement(sql);
			
			
			rs=pstmt.executeQuery();
			if(rs.next()) {x=rs.getInt(1);}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(con,rs,pstmt);
			}
			return x;
		}
		
		//getMember
		public JoinDataBean getMember(String id) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			JoinDataBean members = null;
			String sql="";
			System.out.println("++++++++++++++"+id);
			try {
				conn = getConnection();
				
				/*if(chk.equals("content")) {
				sql="update member where id = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				}*/
				
				sql="select * from member where id = ? ";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					members = new JoinDataBean();
					members.setId(rs.getString("id"));
					members.setName(rs.getString("name"));
					members.setPwd(rs.getString("pwd"));
					members.setGender(rs.getString("gender"));
					members.setBirthdate(rs.getString("birthdate"));
					members.setTel(rs.getString("tel"));
					members.setEmail(rs.getString("email"));
					members.setCon_past(rs.getString("con_past"));
					members.setCon_date(rs.getString("con_date"));
					members.setCon_cat(rs.getString("con_cat"));
					members.setPosition(rs.getString("position"));
					members.setRegdate(rs.getTimestamp("regdate"));
				}
				System.out.println("++++++++++"+members);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(conn,rs,pstmt);
			}return members;
			
		}
	
	private Date toDate(Timestamp date) {
		return date == null?null:new Date(date.getTime());
	}
	
	//login
		public int login(String id, String pwd) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
				
				
			String sql = "SELECT pwd FROM member WHERE id=?";
		
			
			System.out.println("db:"+sql);
			
			try{
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				System.out.println("id:"+id);
				System.out.println("password:"+ pwd);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				System.out.println("rs==="+rs);
				if(rs.next()) {
					if(rs.getString(1).equals(pwd)) {
						
						return 1;	//로그인 성공
					}
					else {
						System.out.println("불일치");
						return 0;	//비밀번호 불일치
					}
				}
				System.out.println("아이디 없다");
				return -1; //아이디가 없다
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -2; //데이터베이스 오류
		}
		
	//insert
		public void insertData(JoinDataBean info) {
			String sql="";
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String id = "";
			
			try {
				
			sql = "insert into member(id,name,pwd,gender,birthdate,tel,email,"
					+ "con_past,con_date,con_cat,position,regdate) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,info.getId());
			pstmt.setString(2,info.getName());
			pstmt.setString(3,info.getPwd());
			pstmt.setString(4,info.getGender());
			pstmt.setString(5,info.getBirthdate());
			pstmt.setString(6,info.getTel());
			pstmt.setString(7,info.getEmail());
			pstmt.setString(8,info.getCon_past());
			pstmt.setString(9,info.getCon_date());
			pstmt.setString(10,info.getCon_cat());
			pstmt.setString(11,info.getPosition());
			//	pstmt.setTimestamp(12, new Timestamp(info.getRegdate().getTime()));
			//*pstmt.setRegdate(new Timestamp(((JoinDataBean) req).getRegdate().getTime()));
			pstmt.executeUpdate();
			}catch(SQLException e1) {
				e1.printStackTrace();
			}finally {
				close(con,rs,pstmt);
			}	
		}	
	
		/**
	     * 아이디 중복체크를 한다.
	     * @param id 아이디
	     * @return x : 아이디 중복여부 확인값
	     *//*
	    public boolean duplicateIdCheck(String id)
	    {
	        Connection conn = null;
	        PreparedStatement pstm = null;
	        ResultSet rs = null;
	        boolean x= false;
	        
	        try {
	            // 쿼리
	            StringBuffer query = new StringBuffer();
	            query.append("SELECT ID FROM MEMBER WHERE ID=?");
	                        
	            conn = getConnection();
	            pstm = conn.prepareStatement(query.toString());
	            pstm.setString(1, id);
	            rs = pstm.executeQuery();
	            
	            if(rs.next()) x= true; //해당 아이디 존재
	            
	            return x;
	            
	        } catch (Exception sqle) {
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstm != null ){ pstm.close(); pstm=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    }*/
		
		//update  
		public int updateData(JoinDataBean info) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			int chk = 0;
			
			try {			
				conn = getConnection();
				String sql = "update member set name=?,pwd=?, email=?,birthdate=?,tel=? where id=? and pwd=?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,info.getName());
				pstmt.setString(2,info.getPwd());
				pstmt.setString(3,info.getEmail());
				pstmt.setString(4,info.getBirthdate());
				pstmt.setString(5,info.getTel());
				pstmt.setString(6,info.getId());
				pstmt.setString(7,info.getPwd());
				chk=pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(conn,null,pstmt);
			}return chk;
		}
		
		//delete
		public int deleteData(String id, String pwd, String admin)throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int x = -1;
			System.out.println(id+":"+pwd+":"+admin);
			try {
				conn = getConnection();
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
			
			
			x=pstmt.executeUpdate();
				System.out.println(x);
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally {
				close(conn,rs,pstmt);
			}return x;
			
		}

}
