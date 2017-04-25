require 'test_helper'

class SessionUsersHelperTest < ActionView::TestCase

  def setup
    @user = users(:rafael)
    user_remember(@user)
  end

  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user
    assert user_is_logged_in?
  end

  test "current_user returns nil when remember_digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end

end
