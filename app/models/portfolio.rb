class Portfolio < ApplicationRecord
  include Placeholder
  # validates :title, :body, :main_image, :thumb_image, presence:true
  # validates :body, presence:true
  # validates :main_image, presence:true
  # validates :thumb_image, presence:true

  validates_presence_of :title, :body, :main_image, :thumb_image

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||=  Placeholder.image_generator(height: '350', width: '200')
  end


  def self.angular
    where(title: 'Angular')
  end

  scope :ruby_on_rails_portfolio_items, lambda { where(subtitle: 'Ruby on rails')}
end
