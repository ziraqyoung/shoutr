class Shout < ApplicationRecord
  validates :body, presence: true, length: { in: 1..144 }
  validates :user, presence: true

  belongs_to :user
end
