class User < ActiveRecord::Base
    has_secure_password 
    has_many :cards
    validates :username, uniqueness: true 
    
end
