class User < ApplicationRecord

    before_save { self.mailaddress = mailaddress.downcase }
    VALID_MAILADDRESS_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :mailaddress, presence: true
    validates :mailaddress, length: { maximum: 255 }
    validates :mailaddress, format: { with: VALID_MAILADDRESS_REGEX }
    validates :mailaddress, uniqueness: { case_sensitive: false }

    validates :password, presence: true
    validates :password, length: { minimum: 8 }
    has_secure_password

   # validates :name, presence: true
end

