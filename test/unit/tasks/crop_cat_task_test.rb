require 'test_helper'

class CropCatTaskTest < ActiveSupport::TestCase
  
  setup do
    @cat = FactoryGirl.create(:cat, :rotated_image_url=>'http://example.com/rotated_image.jpg')
  end

  test "setup" do
    task = CropCatTask.new @cat
    assert_equal @cat.rotated_image_url, task.image_url
  end

  test "crop a cat" do
    task = CropCatTask.new @cat
    task.crop_cat(@cat, [{:new_image_url=>'http://example.com/cropped_image.jpg'}])
    assert_equal 'http://example.com/cropped_image.jpg', @cat.cropped_image_url
  end

end