# Please copy/paste all three classes into this file to submit your solution!



# Build out the following methods on the Review class
# Review.all
# returns all of the reviews
# Review#customer
# returns the customer for that given review
# Review#restaurant
# returns the restaurant for that given review

# the review class needs to be responsible for remembering the customer
#that wrote the review and the restaurant that the review is about
# the customer and restaurant don't know everything about every review

#so, each time a review class is initialized, it MUST contain a customer ID
# and a restaurant ID -- there can be no review without a customer attending
# a restaurant, but a customer can go to a restaurant WITHOUT then later
#writing a review. Foreign keys live here!

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



class Review

  attr_accessor :title, :rating, :customer_name, :restaurant_name

  @@all = []

  def initialize(title, rating, customer_name, restaurant_name)
    @title = title
    @rating = rating
    @customer_name = customer_name
    @restaurant_name = restaurant_name
    @@all << self

  end

  def self.customer
    puts @@all.customer_name
  end

  def self.restaurant
    puts self.restaurant_name
  end


end


# Build the following methods on the customer class
# Customer.all
# should return all of the customers
# Customer.find_by_name(name)
# given a string of a full name, returns the first customer whose full name matches
# Customer.find_all_by_first_name(name)
# given a string of a first name, returns an array containing all customers with that first name
# Customer.all_names
# should return an array of all of the customer full names
# Customer#add_review(restaurant, content)
# given some content and a restaurant, creates a new review and associates it with that customer and that restaurant
#
#  customer -{ reviews
 # restaurant }-{ customers
 # restaurant -{ reviews

class Customer
  attr_accessor :first_name, :last_name

  @@all = []


  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    #iterate through the array of all customers, and use the full_name method
    #to print out the full name of each customer in the array
    @@all.inspect
  end

  def self.find_by_name(name)
    #iterate through the array of all customers (@@all), and return
    #the first instance where both the first name and last name match the
    #string that has been passed in.
    #can use full_name method because it is a class method
    @@all.each do |customer|
      self.full_name == name
    end.first
  end


    def self.find_all_by_first_name(name)
      @@all.each do |customer|
        self.first_name == name
      end
    end


    def self.all_names
      @@all.each do |customer|
        puts   "#{@first_name} #{@last_name}"
      end
    end


end
