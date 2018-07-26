class Potin < ApplicationRecord
 has_many :users
 has_many :likes
 has_many :cities
 has_many :tags
end
