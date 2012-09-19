class TagCatTask
  include SharedWorkforce::Task

  REJECT = ["not a cat", "more than one cat", "photo did not load"]
  ACCEPT = ["fluffy", "soft", "cute", "rough", "scary", "evil"]

  title "Tag this cat"
  instruction "Tick all that apply"

  answer_options REJECT + ACCEPT
  answer_type :tags

  on_success :tag_cat

  def setup(cat)
    self.image_url = cat.image_url
  end

  def tag_cat(cat, responses)
    answers = responses.map{|r| r[:answer] }.flatten
    cat.update_attribute("tags", answers.join(','))

    if answers.any? {|a| a.in?(REJECT) }
      cat.reject!("image was #{answers.to_sentence}.")
    else
      if answers.any?
        cat.audit "Tagged as #{answers.to_sentence}."
      else
        cat.audit "No tags applied."
      end

      RotateCatTask.create(cat)
      ImproveDescriptionOfCatTask.create(cat)
    end
    
    cat.save!
  end
end