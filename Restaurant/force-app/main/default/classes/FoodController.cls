public class FoodController {
    public List<Food__c> foods {get; set;}
    public String fName {get; set;}
    
    public FoodController() {
        this.foods = [SELECT Name, Stock_Amount__c FROM food__c];
        //update this.foods;
    }

    public void getOneRecord() {
        this.foods = [SELECT Name, Stock_Amount__c FROM food__c WHERE Id=:this.fName];
    }

    public void increaseStock() {
        getOneRecord();
        this.foods[0].Stock_Amount__c++;
        this.foods[0].Name = this.foods[0].Name.substringBefore('(');
        update this.foods;
    }

    public void decreaseStock() {
        getOneRecord();
        if (this.foods[0].Stock_Amount__c != 0) {
            this.foods[0].Stock_Amount__c--;
            this.foods[0].Name = this.foods[0].Name.substringBefore('(');
        }
        if (this.foods[0].Stock_Amount__c == 0) {
            this.foods[0].Name = this.foods[0].Name + ' (out of stock)';
        }
        update this.foods;
    }
}