class Waiter
    attr_accessor :name, :years
    @@all = [] 

    def initialize (name, years)
        @name = name 
        @years = years 
        self.class.all << self 
    end 
    def self.all
        @@all
    end 

    def new_meal (customer, total, tip =0)
        Meal.new(self, customer, total, tip)
    end 

    def meals 
        Meal.all.select {|food| food.waiter == self}
    end 

    def best_tipper 
        #binding.pry
        #meals.map {|meal| meal.tip}
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
          end
         
          best_tipped_meal.customer
    end 
end