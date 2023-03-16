class User < ApplicationRecord

    has_secure_password

    validates :firstname, :lastname, :phone_number, :mailing_address, :email_address, presence: true
    validates :email_address, :phone_number, uniqueness: true

end
