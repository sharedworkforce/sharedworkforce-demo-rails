require 'test_helper'

class ImproveDescriptionOfCatTaskTest < ActiveSupport::TestCase
	
	setup do
		@cat = FactoryGirl.create(:cat)
 	end

	test "setup" do
		task = ImproveDescriptionOfCatTask.new @cat
		assert_equal @cat.description, task.text
		assert_equal @cat.image_url, task.image_url
	end

	test "describe a cat" do
		task = ImproveDescriptionOfCatTask.new @cat
		task.describe_cat(@cat, [{:answer=>'Fluffy and nice'}])
		assert_equal 'Fluffy and nice', @cat.improved_description
	end

end