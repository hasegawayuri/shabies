class Board < ApplicationRecord
    #has_many :users
    has_many :groups
    has_many :comments
end
