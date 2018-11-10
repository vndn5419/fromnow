package global.sesoc.dao;

import java.util.List;

import global.sesoc.vo.Favorites;

public interface FavoriteMapper {

   int favoriteInsert(Favorites favorites);
   
   int favoriteDelete(Favorites favorites);
   
   List<Favorites> favoriteSelect(String userid);

   Favorites selectOne(Favorites favorites);

}