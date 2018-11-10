package global.sesoc.dao;

import java.util.ArrayList;

import global.sesoc.vo.Reply;


public interface ReplyMapper {
	public ArrayList<Reply> replyAll(Reply reply);
	
	public int insertReply (Reply reply);
}
