include ActionDispatch::TestProcess

FactoryGirl.define do
	factory :user do |u|
		u.photo { fixture_file_upload(Rails.root + 'test/fixtures/images/electron.jpg', 'image/jpg') }
	end
end