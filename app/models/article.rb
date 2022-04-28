class Article < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy

  def liked? (user)
      !!self.likes.find{|like| like.user_id == user.id }
  end
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
