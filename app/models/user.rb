class User < ApplicationRecord

    has_many :topics
    
    enum role: { admin: 0, student: 1}   
    after_initialize :set_default_role, if: :new_record? 
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 } 

    private

    def set_default_role
        self.role ||= :student
    end    
end