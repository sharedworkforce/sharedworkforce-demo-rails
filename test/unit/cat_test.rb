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
end
