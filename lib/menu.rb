require_relative 'dish.rb'
require_relative 'price_calculator.rb'

class Menu
  attr_reader :price_list, :selected_dishes
  def initialize(price_calculator_class: PriceCalculator)
    @dishes = []
    @price_list = {}
    @selected_dishes = {}
  end

  def price_list
    @price_list.dup
  end

  def selected_dishes
    @selected_dishes.dup
  end

  def add_dishes(*dishes)
    dishes.each {|dish| @dishes << dish}
  end

  def view_prices
    @dishes.each {|dish| @price_list[dish.name] = dish.price}
    price_list
  end

  def select_dish(dish,quantity = 1)
    @selected_dishes[dish] = quantity
  end

  def take_order(selected_dishes)
    @price_calc = PriceCalculator.new(selected_dishes)
    @price_calc.price(selected_dishes)
  end
end
