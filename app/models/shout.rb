class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true
  has_many :likes

  validates :user, presence: true

  delegate :username, to: :user
end
