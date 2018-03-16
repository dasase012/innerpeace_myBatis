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

public class ApptDBMybatis extends MybatisConnector{
	private final String namespace = "ldg.mybatis";	
	//Singleton : getInstance
		private static ApptDBMybatis instance = new ApptDBMybatis();
		public static ApptDBMybatis getInstance() {
			return instance;
		}
		private ApptDBMybatis() {	
		}
		
		SqlSession sqlSession;
		
		//getRecords
		public List getRecords(int startRow, int endRow, String boardid, String id) {
			/*select * from " 
						+"(select rownum rnum,a.* "
						+" from (select num,tel2,con_past,con_cat,doc,appt_date1,appt_date2,medication,med_name,text "
						+ "from consultation where boardid = ? and id = ? order by num desc) "
						+ " a ) where rnum between ? and ? */
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("boardid", boardid);
			map.put("id", id);
			List li = sqlSession.selectList(namespace+".getRecords",map);
			sqlSession.close();
			return li;
		}	
			
		//getApptCount
		public int getApptCount(String boardid){
			/*select nvl(count(*),0) from consultation where boardid = ? */
			int x = 0;
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("boardid", boardid);
			x = sqlSession.selectOne(namespace+".getApptCount", map);
			sqlSession.close();
			return x;
		}
		
		//getRecord
		public ApptDataBean getRecord(int num, String boardid/*, String chk*/) {
			/*select * from consultation where num = ? and boardid = ? */
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("num", num);
			map.put("boardid", boardid);
			

			ApptDataBean records = sqlSession.selectOne(namespace+".getRecord",map);
			sqlSession.commit(); //update가 있으니까 commit!
			sqlSession.close();
			return records;
		}
	
	/*private Date toDate(Timestamp date) {
		return date == null?null:new Date(date.getTime());
	}*/

		
	//*****insert: max로 number 증가시켰는디... 흠
		public void insertData(ApptDataBean info) {
			/*insert into consultation(num,id,boardid,tel2,con_past,con_cat, "
							+ "doc,appt_date1,appt_date2,medication,med_name,text) "
							+ "values(?,?,?,?,?,?,?,?,?,?,?,?)
				*/
			
			
			sqlSession = sqlSession();
			int number = sqlSession.selectOne(namespace+".getNextNumber", info);
					//=============>Board.xml로 들어갈 부분			
			
			//number=number+1;이게 정상적인 번호 증가 방식은 아님. 
			//ORACLE DB에 select boardser.nextval from dual;를 넣어서 자동증가하도록 해야함.
			//pstmt = con.prepareStatement("select nvl(max(num),0) from consultation");
		    //rs=pstmt.executeQuery();
		    //if (rs.next()) {  max=rs.getInt(1)+1;}   
		
				info.setNum(number);
				
				sqlSession.insert(namespace+".insertData", info);
				sqlSession.commit();
				sqlSession.close();
					
		}	
	
		//delete
				public int deleteData(int num)throws Exception{
					
					/*delete from consultation where num=? */
					
					sqlSession = sqlSession();
					Map map = new HashMap();
					map.put("num", num);
					int chk = sqlSession.delete(namespace+".deleteData", map);
					sqlSession.commit(); 
					sqlSession.close();
					return chk;						
				}
				
}
