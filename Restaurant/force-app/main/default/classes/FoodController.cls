public class FoodController {
    public List<Food__c> foods {get; set;}
    
    public FoodController() {
        this.foods = [select name, stock_amount__c from food__c];
    }

    public void increaseStock() {
        this.foods[0].stock_amount__c++;
        update this.foods;
    }

    public void decreaseStock() {
        if (this.foods[0].stock_amount__c != 0) {
            this.foods[0].stock_amount__c--;
        }
        update this.foods;
    }
}