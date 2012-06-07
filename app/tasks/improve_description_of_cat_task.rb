class ImproveDescriptionOfCatTask
	include SharedWorkforce::Task

	title "Improve the description of this cat"
	guidelines "Improve the descrption to make it more accurate, fix spelling mistakes, improve grammar and add some more descriptive language. (e.g. describe what it is doing)"

	answer_type :edit

	on_success :describe_cat

	def setup(cat)
		self.text = cat.description
	end

	def describe_cat(cat, responses)
		cat.audit "Cat described as #{responses.first[:answer]}."
		cat.update_attribute(:improved_description, responses.first[:answer])
	end
end