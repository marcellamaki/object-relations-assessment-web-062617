# Restaurant.all
# returns an array of all restaurants (**THIS IS THE OBJECT NOT THE NAME!)
# Restaurant.find_by_name(name)
# given a string of restaurant name, returns the first restaurant that matches
# Restaurant#reviews
# returns an array of all reviews for that restaurant
# Restaurant#customers
# should return all of the customers who have written reviews of that restaurant.
#
# a restaurant has many reviews through it's customers (those that elect to review)
#


class Restaurant

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all.inspect
  end

  def self.find_by_name(name)
    self.class.select do |restaurant|
      Restaurant.name == name
    end.first
  end

  def self.reviews
    self.select do |review|
      review.restaurant_name == self.name
    end
  end

  def self.customers
    self.select do |review|
      review.restaurant_name == self.name
      #returns all the reviews of this restaurant
    end.select do |customer|
      review.customer_name == Customer.name
    end
  end



end
