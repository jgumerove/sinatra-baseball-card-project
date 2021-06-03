class Card < ActiveRecord::Base
    belongs_to :user
    validates :player_name, :brand, :year, presence: :true
    validates :price, numericality: {greater_than_or_equal_to: 0}
    validates :year, numericality: {greater_than_or_equal_to: 1850, less_than_or_equal_to: Date.today.year}

    def separate_comma
        a = self.price.to_s.split('')
        b = a.size/3.0
        if a.size < 4
           self.price.to_s 
        elsif a.size%3 == 0
          n = -4
          (b.to_i-1).times do |i|
            a.insert(n, ',')
            n -= 4
          end
           a.join("")
        else
            n = -4
          b.to_i.times do |i|
            a.insert(n, ',')
            n -= 4
          end
          a.join("")
        end
      end
    
end
