class City < ApplicationRecord
  has_many :potins
  has_many :users
end
