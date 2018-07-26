class User < ApplicationRecord
 has_many :potins
 has_many :comments
end
