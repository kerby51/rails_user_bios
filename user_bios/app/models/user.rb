class User < ActiveRecord::Base
  has_many :stories

  validates_presence_of :name, :address, :city, :email
  validates :email, uniqueness: true
  validates_format_of :email, with: /\w@/
end
