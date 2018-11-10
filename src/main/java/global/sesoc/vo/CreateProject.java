package global.sesoc.vo;

import java.util.List;

public class CreateProject {

   private Project project;
   private List<Shipping> shippingList;

   public CreateProject() {
   }

   public Project getProject() {
      return project;
   }

   public void setProject(Project project) {
      this.project = project;
   }

   public List<Shipping> getShippingList() {
      return shippingList;
   }

   public void setShippingList(List<Shipping> shippingList) {
      this.shippingList = shippingList;
   }

   @Override
   public String toString() {
      return "CreateProject [project=" + project + ", shippingList=" + shippingList + "]";
   }

}