class CropCatTask
  include SharedWorkforce::Task

  title "Crop the cat's eyes"
  instruction "Crop around the eyes, as closely as you can"

  answer_type :crop

  on_success :crop_cat

  def setup(cat)
    self.image_url = cat.rotated_image_url
  end

  def crop_cat(cat, responses)
    cat.audit "Eyes identified."
    cat.update_attribute(:cropped_image_url, responses.first[:new_image_url])
  end
end