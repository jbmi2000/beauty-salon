class Customer < ActiveRecord::Base

    # has_many :appointments
    # has_many :users, through: :appointments
    
    
    belongs_to :user  #<<---uncomment this to return
    belongs_to :appointments # has_one :user           

end