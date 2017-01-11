class Review < ApplicationRecord
  validates :user, uniqueness: { scope: :restaurant, message: "has reviewed this restaurant already"}

  belongs_to :user
  belongs_to :restaurant
  validates :rating, inclusion: (1..5)

end
