class Group < ApplicationRecord
    has_many :id
    has_many :tags
    has_many :members
end
