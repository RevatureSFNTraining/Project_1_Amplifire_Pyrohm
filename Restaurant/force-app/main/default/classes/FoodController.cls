public class FoodController {
    public List<Food__c> foods {get; set;}
    public String fName {get; set;}
    
    public FoodController() {
        this.foods = [select name, stock_amount__c from food__c];
    }

    public void increaseStock() {
        this.foods = [select id, name, stock_amount__c from food__c where id=:this.fName];
        this.foods[0].stock_amount__c++;
        //update this.foods;
    }

    public void decreaseStock() {
        this.foods = [select id, name, stock_amount__c from food__c where id=:this.fName];
        if (this.foods[0].stock_amount__c != 0) {
            this.foods[0].stock_amount__c--;
        }
        //update this.foods;
    }
}