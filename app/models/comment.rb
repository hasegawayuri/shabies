class Comment < ApplicationRecord
    belongs_to :board, optional: true
end
