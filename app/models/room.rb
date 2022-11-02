class Room < ApplicationRecord
    has_many :chats
    has_many :userrooms
end
