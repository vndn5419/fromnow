package global.sesoc.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.vo.Reply;
import global.sesoc.vo.Rereply;

@Repository
public class RereplyRepository {
	//SqlSession 필요
	@Autowired
	SqlSession session;
	
	
	public ArrayList<Rereply> rereplyAll(Rereply rereply){
		RereplyMapper mapper = session.getMapper(RereplyMapper.class); 
		ArrayList<Rereply> list = new ArrayList<>();
		list = mapper.rereplyAll(rereply);
		System.out.println("repository ="+list);
		return list;
	}
	
	
public int insertRereply (Rereply rereply) {
	RereplyMapper mapper = session.getMapper(RereplyMapper.class);
		int result = mapper.insertRereply(rereply);
		return result;
	};
	

}
