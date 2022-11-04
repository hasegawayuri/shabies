class Group < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :tag, optional: true
    has_many :members
    has_many :classifications
    has_many :gpins
    has_many :boards
end
