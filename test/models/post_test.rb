require "test_helper"

class PostTest < ActiveSupport::TestCase


  test "draft? returns true for draft posts"
  assert Post.new(published_at: nil).draft?
  end
end
