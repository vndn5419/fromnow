package global.sesoc.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.vo.Reply;

@Repository
public class ReplyRepository {
	//SqlSession 필요
	@Autowired
	SqlSession session;
	
	
	public ArrayList<Reply> replyAll(Reply reply){
		ReplyMapper mapper = session.getMapper(ReplyMapper.class); 
		ArrayList<Reply> list = new ArrayList<>();
		list = mapper.replyAll(reply);
		System.out.println("repository ="+list);
		return list;
	}
	
	
	public int insertReply (Reply reply) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		int result = mapper.insertReply(reply);
		return result;
	};
	

}
