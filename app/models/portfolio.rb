class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                        reject_if: lambda { |attrs| attrs['name'].blank?}

  validates_presence_of :title, :body, :main_image, :thumb_image

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||=  Placeholder.image_generator(height: '350', width: '200')
  end


  def angular
    where(title: 'Angular').order()
  end

  scope :ruby_on_rails_portfolio_items, lambda { where(subtitle: 'Ruby on rails')}
end
