# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string
#  last_name          :string
#  email              :string           not null
#  encrypted_password :string           not null
#

class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  has_many :posts, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
