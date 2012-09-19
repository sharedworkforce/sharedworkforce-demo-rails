class ImproveDescriptionOfCatTask
  include SharedWorkforce::Task

  title "Describe a cat"
  instruction "Improve the descrption to make it more accurate, fix spelling mistakes, improve grammar and add some more descriptive language. (e.g. describe what it is doing)"

  answer_type :edit

  on_success :describe_cat

  def setup(cat)
    self.text = cat.description
    self.image_url = cat.image_url
  end

  def describe_cat(cat, responses)
    cat.audit "Cat described as #{responses.first[:answer]}."
    cat.update_attribute(:improved_description, responses.first[:answer])
  end
end