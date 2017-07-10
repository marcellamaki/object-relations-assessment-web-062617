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
