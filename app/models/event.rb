class Event < ApplicationRecord
  # belongs_to :user
  validates :description, :name, :event_date, :category_id, presence: true
  belongs_to :organisor, class_name: "User"
  belongs_to :category

  has_many :comments
  has_many :registrations
  has_many :users, :through => :registrations
end
