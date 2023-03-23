class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :gathering, foreign_key: "organisor_id", class_name: "Event"

  has_one :address, :as => :addressable
  has_many :comments

  has_many :likes

  has_many :post_comments
  has_many :post_likes

  
  has_many :registrations
  has_many :events, :through => :registrations
end
