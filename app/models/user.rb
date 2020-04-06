class User < ApplicationRecord

    has_secure_password

    has_many :runs

    validates :email, uniqueness: true

end