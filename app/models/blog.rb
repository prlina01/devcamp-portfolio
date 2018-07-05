class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :topic

  validates :title, :body, presence:true
 # validates :body, presence:true
end
