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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'blank_post' do
    assert_not Post.new.valid?
  end

  test 'valid_post' do
    assert posts(:one).valid?
  end

  test 'delete_post_deletes_comment' do
    post = posts(:one)
    post.comments.create!(body: 'Hello, World')
    assert_equal Comment.all.size, 1
    post.destroy!
    assert_equal Comment.all.size, 0
  end
end
