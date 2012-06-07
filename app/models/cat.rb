class Cat < ActiveRecord::Base

  has_many :audits
  after_save :tag_image, :if=>:image_url_changed?
  scope :finished, where('cropped_image_url IS NOT NULL')

  def tag_image
  	TagCatTask.create(self)
  end

  def reject!(comment)
    update_attribute(:rejected, true)
    audit "Rejected because #{comment}"
  end

  def audit(comment)
    audits << Audit.new(:comment=>comment)
  end

end
