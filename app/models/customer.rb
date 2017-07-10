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
