require 'test_helper'

class TagCatTaskTest < ActiveSupport::TestCase
  
  setup do
    @cat = FactoryGirl.create(:cat)
  end

  test "setup" do
    task = TagCatTask.new @cat
    assert_equal @cat.image_url, task.image_url
  end

  test "rejecting a cat adds an audit" do
    task = TagCatTask.new @cat
    task.tag_cat(@cat, [{:answer=>TagCatTask::REJECT.first}])
    assert_match /^Rejected/, @cat.audits.last.comment
  end

  test "rejecting a cat marks as rejected" do
    task = TagCatTask.new @cat
    task.tag_cat(@cat, [{:answer=>TagCatTask::REJECT.first}])
    assert @cat.rejected?
  end

  test "rejecting a cat sends a notification" do
    task = TagCatTask.new @cat
    @cat.expects(:send_notification).once
    task.tag_cat(@cat, [{:answer=>TagCatTask::REJECT.first}])
  end

  test "rotate after accepting" do
    task = TagCatTask.new @cat
    RotateCatTask.expects(:create).with(@cat)
    task.tag_cat(@cat, [{:answer=>TagCatTask::ACCEPT.first}])
    assert_match /#{TagCatTask::ACCEPT.first}/, @cat.audits.last.comment
  end

  test "improve description after accepting" do
    task = TagCatTask.new @cat
    ImproveDescriptionOfCatTask.expects(:create).with(@cat)
    task.tag_cat(@cat, [{:answer=>TagCatTask::ACCEPT.first}])
    assert_match /#{TagCatTask::ACCEPT.first}/, @cat.audits.last.comment
  end

end