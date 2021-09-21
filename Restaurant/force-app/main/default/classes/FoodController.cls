public class FoodController {
    public List<Food__c> food {get; set;}
    
    public FoodController() {
        this.food = [select name, stock_amount__c from food__c];
    }

    public void increaseStock(Food__c f) {
        f.stock_amount__c++;
        update this.food;
    }

    public void decreaseStock(Food__c f) {
        if (f.stock_amount__c != 0) {
            f.stock_amount__c--;
        }
        update this.food;
    }
}