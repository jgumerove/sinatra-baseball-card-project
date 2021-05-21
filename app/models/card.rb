class Card < ActiveRecord::Base
    belongs_to :user
    validates :player_name, :brand, :year, presence: :true
    validates :price, numericality: {greater_than_or_equal_to: 0}
    validates :year, numericality: {greater_than_or_equal_to: 1850, less_than_or_equal_to: Date.today.year}
end
