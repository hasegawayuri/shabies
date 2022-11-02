class Board < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :group, optional: true
    has_many :comments
    has_many :bpins
end
