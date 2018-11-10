package global.sesoc.dao;

import java.util.ArrayList;

import global.sesoc.vo.Rereply;


public interface RereplyMapper {
	public ArrayList<Rereply> rereplyAll(Rereply rereply);
	
	public int insertRereply (Rereply rereply);
}
