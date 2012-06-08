class RotateCatTask
	include SharedWorkforce::Task

	title "Flip a cat"
	instruction "Make this cat upside down."
	guidelines "* Simply continue if the cat is already upside down"

	answer_type :rotate

	on_success :rotate_cat

	def setup(cat)
		self.image_url = cat.image_url
	end

	def rotate_cat(cat, responses)
		cat.audit "Cat flipped."
		cat.update_attribute(:rotated_image_url, responses.first[:new_image_url])
		CropCatTask.create(cat)
	end
end