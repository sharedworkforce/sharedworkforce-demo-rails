require 'test_helper'

class TagPhotoTaskTest < ActiveSupport::TestCase
	
	setup do
		User.any_instance.stubs(:save_attached_files).returns(true)
		@user = FactoryGirl.create(:user)
 	end

	test "setup" do
		task = TagPhotoTask.new @user
		assert_equal @user.photo.url, task.image_url
	end

	test "tag_user with offensive" do
		task = TagPhotoTask.new @user
		task.tag_user(@user, [{:answer=>['Offensive']}])
		assert_equal "Uploaded offensive photo!", @user.comments
	end

	test "tag_user with nothing" do
		task = TagPhotoTask.new @user
		task.tag_user(@user, [{:answer=>[]}])
		assert_equal "Photo checked and ok", @user.comments
	end
end