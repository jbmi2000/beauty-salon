class Customer < ActiveRecord::Base

   
    
    belongs_to :user  #<<---uncomment this to return
    belongs_to :appointments # has_one :user    
    
    validates :name, presence: true

end