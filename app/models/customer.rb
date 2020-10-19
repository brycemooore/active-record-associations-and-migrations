class Customer < ActiveRecord::Base

    has_many :reviews
    has_many :restaurants, through: :reviews

    def full_name
        "#{self.given_name} #{self.family_name}"
    end 

    def add_review(restaurant, rating)
        Review.find_or_create_by(restaurant_id: restaurant.id, customer_id: self.id, rating: rating)
    end 

    def num_reviews
        self.reviews.count
    end 

    def self.find_by_name(name)
        self.find_by(given_name: name.split(/\s/)[0], family_name: name.split(/\s/)[1])
    end

    def self.find_all_by_given_name(name)
        self.where(given_name: name)
    end 

    def self.order_by_num_reviews
        self.all.sort{|a, b|
            b.reviews.count <=> a.reviews.count
        }
    end 

    def self.order_by_num_reviews2
        self.includes(:reviews).group(Arel.sql("reviews.restaurant_id")).order(Arel.sql("COUNT(reviews.restaurant_id"))
    end

end