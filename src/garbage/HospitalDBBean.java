package garbage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HospitalDBBean {
	//Singleton : getInstance
			private static HospitalDBBean instance = new HospitalDBBean();
			public static HospitalDBBean getInstance() {
				return instance;
			}
			private HospitalDBBean() {	
			}
		

		//Connection method
			public static Connection getConnection(){
				Connection conn = null;
				try {
					/*String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";*///	HOME
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
		
			//getRecords
			public List getHospitals(int startRow, int endRow, String boardid) {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List hosList = null;
				String sql="";
				
				try {
					conn = getConnection();
					sql = "select * from " 
							+"(select rownum rnum,a.* "
							+" from (select num,local,hos_name,address,tel,hp "
							+ "from hospital_list where boardid = ? order by num desc) "
							+ " a ) where rnum between ? and ? ";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, boardid);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
					rs=pstmt.executeQuery();
					
				if(rs.next()) {
					hosList = new ArrayList();
					do{
						HospitalDataBean hos = new HospitalDataBean();
						hos.setNum(rs.getInt("num"));
						hos.setLocal(rs.getString("local"));
						hos.setHos_name(rs.getString("hos_name"));
						hos.setAddress(rs.getString("address"));
						hos.setTel(rs.getString("tel"));						
						hos.setHp(rs.getString("hp"));
						hosList.add(hos);						
					}while(rs.next());}
				}catch(Exception ex) {
					ex.printStackTrace();
				}finally {
					close(conn,rs,pstmt);
				}
				return hosList;
			}

			//getApptCount
			public int getHosCount(String boardid){
				int x=0;
				String sql="select nvl(count(*),0) from hospital_list where boardid = ? ";
				Connection con = getConnection();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				int num = 0;
				
				try {
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, boardid);
				rs=pstmt.executeQuery();
				if(rs.next()) {x=rs.getInt(1);}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					close(con,rs,pstmt);
				}
				return x;
			}
			
			//getRecord
			public HospitalDataBean getHospital(int num, String boardid) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				HospitalDataBean hos = null;
				String sql="";
				
				try {
					conn = getConnection();

					sql="select * from hospital_list where num = ? and boardid = ? ";
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.setString(2, boardid);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						hos.setNum(rs.getInt("num"));
						hos.setLocal(rs.getString("local"));
						hos.setHos_name(rs.getString("hos_name"));
						hos.setAddress(rs.getString("address"));
						hos.setTel(rs.getString("tel"));						
						hos.setHp(rs.getString("hp"));				
						
					}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					close(conn,rs,pstmt);
				}return hos;
				
			}
		
}
