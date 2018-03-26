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
			
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("boardid", boardid);
			map.put("id", id);
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			List li = sqlSession.selectList(namespace+".getRecords",map);
			sqlSession.close();
			return li;
		}	
			
		//getApptCount
		public int getApptCount(String boardid){
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
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("num", num);
			map.put("boardid", boardid);
			

			ApptDataBean records = sqlSession.selectOne(namespace+".getRecord",map);
			sqlSession.close();
			return records;
		}

		
	
		public void insertAppt(ApptDataBean info) {
					
			sqlSession = sqlSession();
			int number = sqlSession.selectOne(namespace+".getNextNumber", info);

				info.setNum(number);
				
				sqlSession.insert(namespace+".insertAppt", info);
				sqlSession.commit();
				sqlSession.close();
					
		}	
	
		//delete
				public int deleteAppt(int num)throws Exception{
				
					sqlSession = sqlSession();
					Map map = new HashMap();
					map.put("num", num);
					int chk = sqlSession.delete(namespace+".deleteAppt", map);
					sqlSession.commit(); 
					sqlSession.close();
					return chk;						
				}
				
}
