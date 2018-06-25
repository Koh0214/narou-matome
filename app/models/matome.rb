class Matome < ApplicationRecord
  is_impressionable
  belongs_to :user
  has_many :novels
end
