class Matome < ApplicationRecord
  belongs_to :user
  has_many :novels
end
