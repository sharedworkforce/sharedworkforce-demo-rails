require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
  	@cat = FactoryGirl.create(:cat)
  end

  test "tag cat when created" do
  	cat = FactoryGirl.build(:cat)
  	cat.expects(:tag_cat).once
  	cat.save!
  end

  test "reject cat comment" do
  	@cat.reject! "soft"
  	assert_match /^Rejected/, @cat.audits.first.comment
  end

  test "reject cat sets rejected to true" do
  	@cat.reject! "soft"
  	assert @cat.rejected?
  end

  test "audit with comment" do
  	@cat.audit "very fluffy"
  	assert_equal "very fluffy", @cat.audits.first.comment
  end

  test "finished" do
    @cat.cropped_image_url = 'http://example.com/cropped.jpg'
    assert @cat.finished?
  end

  test "not finished" do
    @cat.cropped_image_url = nil
    assert !@cat.finished?
  end

  test "send notification if finished and email present" do
    @cat.notification_email = 'berry@example.com'
    @cat.stubs(:finished?).returns(true)

    @cat.expects(:send_notification).once
    @cat.save!
  end

  test "no notification if not finished" do
    @cat.stubs(:finished?).returns(false)
    @cat.notification_email = 'berry@example.com'

    @cat.expects(:send_notification).never
    @cat.save!
  end
end
