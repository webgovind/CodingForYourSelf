class Topic < ApplicationRecord
  belongs_to :user
  has_many :questions
end
