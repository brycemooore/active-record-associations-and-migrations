class Restaurant < ActiveRecord::Base

    has_many :reviews
    has_many :customers, through: :reviews

    def average_star_rating
        self.reviews.sum{|review|
            review.rating
    }.to_f / self.reviews.count.to_f
    end

    def self.order_by_name
        self.order(:name)
    end
 
end 