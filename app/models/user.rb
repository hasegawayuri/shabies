class User < ApplicationRecord

    before_save { self.mailaddress = mailaddress.downcase }
    VALID_MAILADDRESS_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mailaddress, presence: true
    validates :mailaddress, length: { maximum: 255 }
    validates :mailaddress, format: { with: VALID_MAILADDRESS_REGEX }
    validates :mailaddress, uniqueness: { case_sensitive: false }

    validates :password, presence: true, on: :create
    validates :password, length: { minimum: 8 }, on: :create
    has_secure_password

    has_many :groups
    has_many :chats
    has_many :userrooms
    has_many :gpins
    has_many :bpins
    has_many :members
    has_many :boards
#   validates :name, presence: true
end

