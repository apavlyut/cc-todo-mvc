require 'test_helper'

class TodoMailerTest < ActionMailer::TestCase
  test "comment_added" do
    mail = TodoMailer.comment_added
    assert_equal "Comment added", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
