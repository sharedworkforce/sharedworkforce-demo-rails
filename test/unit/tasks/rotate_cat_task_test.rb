require 'test_helper'

class RoateCatTaskTest < ActiveSupport::TestCase
  
  setup do
    @cat = FactoryGirl.create(:cat)
  end

  test "setup" do
    task = RotateCatTask.new @cat
    assert_equal @cat.image_url, task.image_url
  end

  test "rotate a cat" do
    task = RotateCatTask.new @cat
    task.rotate_cat(@cat, [{:new_image_url=>'http://example.com/rotated_image.jpg'}])
    assert_equal 'http://example.com/rotated_image.jpg', @cat.rotated_image_url
  end

end