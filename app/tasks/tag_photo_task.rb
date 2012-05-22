class TagPhotoTask
	include SharedWorkforce::Task

	title "Please tag this photo"
	answer_options ["Offensive", "Contains branding"]
	answer_type :tags

	on_success :tag_user

	def setup(user)
		self.image_url = user.photo.url
	end

	def tag_user(user, responses)
		if responses.map {|r| r[:answer]}.flatten.include?('Offensive')
			user.comments = "Uploaded offensive photo!"
		else
			user.comments = "Photo checked and ok"
		end
		user.save!
	end
end