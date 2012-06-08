class Cat < ActiveRecord::Base

  has_many :audits
  after_save :tag_image, :if=>:image_url_changed?
  scope :finished, where('cropped_image_url IS NOT NULL')
  scope :rejected, where(:rejected => true)
  scope :pending, where('rejected = ? AND cropped_image_url IS NOT NULL', false)

  validates :description, :presence=>true
  validates :image_url, :presence=>true

  def pending?
    cropped_image_url.blank? && !rejected
  end

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
