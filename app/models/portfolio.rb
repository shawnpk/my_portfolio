class Portfolio < ApplicationRecord
  extend FriendlyId
  include Placeholder

  has_many :technologies

  after_initialize :set_defaults

  validates :title, presence: true
  validates :body, presence: true
  validates :main_image, presence: true
  validates :thumb_image, presence: true

  friendly_id :title, use: :slugged

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

  def self.angular
    where(subtitle: 'Angular')
  end

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
