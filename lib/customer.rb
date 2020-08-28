require 'pry' 
class Customer
  attr_accessor :name, :age 
    @@all = []

  def initialize (name, age)
    @name = name 
    @age = age 
    self.class.all << self
  end 
  def self.all
    @@all
  end 

  def new_meal (waiter, total, tip = 0)
    Meal.new(waiter, self, total, tip)
  end 

  def meals
    #binding.pry
    Meal.all.select {|m| m.customer == self}
  end 

  def waiters
    
    meals.map {|meal| meal.waiter}
    #binding.pry
  end 
end