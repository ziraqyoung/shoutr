class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true
  has_many :likes

  searchkick

  validates :user, presence: true

  delegate :username, to: :user

  def search_data
    {
      content: (
        case content
        when TextShout then content.body
        when PhotoShout then content.image.filename
        end
      )
    }
  end
end
