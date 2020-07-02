class Customer < ActiveRecord::Base

    has_many :appointments
    has_many :users, through:appointments
    
    # belongs_to :user  
    # has_one :user           

end