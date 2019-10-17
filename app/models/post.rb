# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  include Taggable

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :body, :title, presence: true

  def self.search(query)
    if query.present?
      posts = joins(taggings: :tag).includes(taggings: :tag)
      posts.where(['title LIKE ?', "%#{query}%"]).or(
      posts.where(['body LIKE ?', "%#{query}%"])).or(
      posts.where(['tags.name LIKE ?', "%#{query}%"]))
    else
      self
    end
  end
end
