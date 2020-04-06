class User < ApplicationRecord

    has_secure_password

    has_many :runs

    validates :email, uniqueness: true

    def total_distance
        total = 0
        self.runs.each{|run| total += run.distance}
        total
    end

    def last_five
        self.runs.order(created_at: :desc).limit(5)
    end

end