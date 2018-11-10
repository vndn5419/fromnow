package global.sesoc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.dao.FavoriteRepository;
import global.sesoc.vo.Favorites;
import global.sesoc.vo.Project;
import global.sesoc.vo.Sale;

@Controller
public class FavoriteController {
   
   @Autowired
   FavoriteRepository repository;
   
   @ResponseBody
   @RequestMapping(value="/favoriteInsert", method=RequestMethod.POST)
   public int favoriteInsert(@RequestBody Favorites favorites) {
   
      
      System.out.println(favorites);
      int result=repository.favoriteInsert(favorites);
      
      return result;
   }
   
   @ResponseBody
   @RequestMapping(value="/favoriteDelete", method=RequestMethod.POST)
   public int favoriteDelete(@RequestBody Favorites favorites) {
      
      System.out.println(favorites+"해제 ㅎㅎ");
      int result=repository.favoriteDelete(favorites);
      
      return result;
   }
   
   @RequestMapping(value="/favoritePage", method=RequestMethod.GET)
   public String favoriteSelect(String userid,Model model, Project project) {
      List<Favorites> favorites= repository.favoriteSelect(userid);
      model.addAttribute("project", project);
      model.addAttribute("favorites", favorites);
      
      return "member/sale/favoritePage";
   }
   
   
/*   @RequestMapping(value="/favoritePage", method=RequestMethod.POST)
   public String favoritePage(Favorites favorites,Model model, Product project) {
      
      model.addAttribute("project", project);
      model.addAttribute("favorites", favorites);
      int result = repository.favoriteSelect(favorites);
      System.out.println("페이보릿콘");
      
      return "member/sale/favoritePage";
   }*/
   
   

}