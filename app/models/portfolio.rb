class Portfolio < ApplicationRecord
  # extend FriendlyId

  has_many :technologies, dependent: :destroy

  accepts_nested_attributes_for :technologies,
  reject_if: lambda { |attrs| attrs['name'].blank? }

  # friendly_id :title, use: :slugged

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  validates :title, presence: true
  validates :body, presence: true

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order('position ASC')
  end
end
