package member2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


public class MybatisDao extends MybatisConnector{
	private final String namespace = "ldg.mybatis";
	private static MybatisDao instance = new MybatisDao();
	public static MybatisDao getInstance() {
		return instance;
	}
	SqlSession sqlSession;
	//JoinDataBean
	public List<JoinDataBean> selectMember(){
		sqlSession = sqlSession();
		System.out.println("selectmember");
		try {
			return sqlSession.selectList(namespace+".memberList");
		}finally {
			sqlSession.close();
		}
	}
	public List<JoinDataBean> selectMember(int num){
		sqlSession = sqlSession();
		System.out.println("selectmember");
		Map map = new HashMap(); map.put("num", num);
		try {
			return sqlSession.selectList(namespace+".memberList",map);
		}finally {
			sqlSession.close();
		}
	}
	public List<JoinDataBean> selectMember(String boardid){
		sqlSession = sqlSession();
		Map map = new HashMap(); map.put("boardid", boardid);
		try {
			return sqlSession.selectList(namespace+".boardList",map);
		}finally {
			sqlSession.close();
		}
	}

	//ApptDataBean
		public List<ApptDataBean> selectAppt(){
			sqlSession = sqlSession();
			System.out.println("selectappt");
			try {
				return sqlSession.selectList(namespace+".apptList");
			}finally {
				sqlSession.close();
			}
		}
		public List<ApptDataBean> selectAppt(int num){
			sqlSession = sqlSession();
			System.out.println("selectappt");
			Map map = new HashMap(); map.put("num", num);
			try {
				return sqlSession.selectList(namespace+".apptList",map);
			}finally {
				sqlSession.close();
			}
		}
		public List<ApptDataBean> selectAppt(String boardid){
			sqlSession = sqlSession();
			Map map = new HashMap(); map.put("boardid", boardid);
			try {
				return sqlSession.selectList(namespace+".apptList",map);
			}finally {
				sqlSession.close();
			}
		}

}
