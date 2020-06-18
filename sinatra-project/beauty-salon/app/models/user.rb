class User < ActiveRecord::Base

    has_many :customers
    has_many :appointments

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true    

    has_secure_password # for authenticate method
end
