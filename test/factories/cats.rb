include ActionDispatch::TestProcess

FactoryGirl.define do
	factory :cat do |c|
		description "Factory description"
		image_url "http://example.com/factory_image.jpg"
	end
end