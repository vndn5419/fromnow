package global.sesoc.vo;

public class Project {

   private int project_num;
   private String project_title;
   private String project_coverImage;
   private String project_content;
   private int project_nowfundprice;
   private int project_goalfundprice;
   private String project_startdate;
   private String project_goaldate;
   private int project_hitcount;
   private String project_location;
   private String project_category;
   private String project_video;
   private String reward_title;
   private int reward_price;
   private String reward_description;
   private String reward_deliverydate;
   private String project_checked;
   private String co_id;

   public Project() {
   }

   public int getProject_num() {
      return project_num;
   }

   public void setProject_num(int project_num) {
      this.project_num = project_num;
   }

   public String getProject_title() {
      return project_title;
   }

   public void setProject_title(String project_title) {
      this.project_title = project_title;
   }

   public String getProject_coverImage() {
      return project_coverImage;
   }

   public void setProject_coverImage(String project_coverImage) {
      this.project_coverImage = project_coverImage;
   }

   public String getProject_content() {
      return project_content;
   }

   public void setProject_content(String project_content) {
      this.project_content = project_content;
   }

   public int getProject_nowfundprice() {
      return project_nowfundprice;
   }

   public void setProject_nowfundprice(int project_nowfundprice) {
      this.project_nowfundprice = project_nowfundprice;
   }

   public int getProject_goalfundprice() {
      return project_goalfundprice;
   }

   public void setProject_goalfundprice(int project_goalfundprice) {
      this.project_goalfundprice = project_goalfundprice;
   }

   public String getProject_startdate() {
      return project_startdate;
   }

   public void setProject_startdate(String project_startdate) {
      this.project_startdate = project_startdate;
   }

   public String getProject_goaldate() {
      return project_goaldate;
   }

   public void setProject_goaldate(String project_goaldate) {
      this.project_goaldate = project_goaldate;
   }

   public int getProject_hitcount() {
      return project_hitcount;
   }

   public void setProject_hitcount(int project_hitcount) {
      this.project_hitcount = project_hitcount;
   }

   public String getProject_location() {
      return project_location;
   }

   public void setProject_location(String project_location) {
      this.project_location = project_location;
   }

   public String getProject_category() {
      return project_category;
   }

   public void setProject_category(String project_category) {
      this.project_category = project_category;
   }

   public String getProject_video() {
      return project_video;
   }

   public void setProject_video(String project_video) {
      this.project_video = project_video;
   }

   public String getReward_title() {
      return reward_title;
   }

   public void setReward_title(String reward_title) {
      this.reward_title = reward_title;
   }

   public int getReward_price() {
      return reward_price;
   }

   public void setReward_price(int reward_price) {
      this.reward_price = reward_price;
   }

   public String getReward_description() {
      return reward_description;
   }

   public void setReward_description(String reward_description) {
      this.reward_description = reward_description;
   }

   public String getReward_deliverydate() {
      return reward_deliverydate;
   }

   public void setReward_deliverydate(String reward_deliverydate) {
      this.reward_deliverydate = reward_deliverydate;
   }

   public String getProject_checked() {
      return project_checked;
   }

   public void setProject_checked(String project_checked) {
      this.project_checked = project_checked;
   }

   public String getCo_id() {
      return co_id;
   }

   public void setCo_id(String co_id) {
      this.co_id = co_id;
   }

   @Override
   public String toString() {
      return "Project [project_num=" + project_num + ", project_title=" + project_title + ", project_coverImage="
            + project_coverImage + ", project_content=" + project_content + ", project_nowfundprice="
            + project_nowfundprice + ", project_goalfundprice=" + project_goalfundprice + ", project_startdate="
            + project_startdate + ", project_goaldate=" + project_goaldate + ", project_hitcount="
            + project_hitcount + ", project_location=" + project_location + ", project_category=" + project_category
            + ", project_video=" + project_video + ", reward_title=" + reward_title + ", reward_price="
            + reward_price + ", reward_description=" + reward_description + ", reward_deliverydate="
            + reward_deliverydate + ", project_checked=" + project_checked + ", co_id=" + co_id + "]";
   }

}