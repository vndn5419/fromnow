package global.sesoc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.vo.Favorites;

@Repository
public class FavoriteRepository {

   @Autowired
   SqlSession session;
   
   
   public int favoriteInsert(Favorites favorites)
   {
      FavoriteMapper mapper = session.getMapper(FavoriteMapper.class);
      int result = mapper.favoriteInsert(favorites);
      System.out.println(result);
      return result;
   }
   
   public int favoriteDelete(Favorites favorites)
   {
      FavoriteMapper mapper =  session.getMapper(FavoriteMapper.class);
      int result = mapper.favoriteDelete(favorites); 
      
      System.out.println(result);
      return result;
   }
   
   public List<Favorites> favoriteSelect(String userid)
   {
      FavoriteMapper mapper = session.getMapper(FavoriteMapper.class);
      List<Favorites> favorites =mapper.favoriteSelect(userid);
      return favorites;
   }

   public Favorites selectOne(Favorites favorites) {
	   FavoriteMapper mapper = session.getMapper(FavoriteMapper.class);
	   Favorites favorite = mapper.selectOne(favorites);
	   return favorite;
   }
   
}