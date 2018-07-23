class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  validates :content, presence: true, length: {10..1000}
end
