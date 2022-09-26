require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'name' do
    assert_equal 'John', users(:user1).name
  end
end
