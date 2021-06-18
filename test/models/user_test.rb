# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = User.new(email: 'fuga@exapmle.com', name: '')
    assert_equal 'fuga@exapmle.com', user.name_or_email

    user.name = 'user'
    assert_equal 'user', user.name_or_email
  end

  test '#follow_unfollow' do
    user1 = User.create(email: 'user1@example.com', password: 'hogehoge')
    user2 = User.create(email: 'user2@example.com', password: 'hogehoge')

    assert_not user1.following?(user2)
    assert_not user2.followed_by?(user1)

    user1.follow(user2)
    assert user1.following?(user2)
    assert user2.followed_by?(user1)

    user1.unfollow(user2)
    assert_not user1.following?(user2)
    assert_not user2.followed_by?(user1)
  end
end
