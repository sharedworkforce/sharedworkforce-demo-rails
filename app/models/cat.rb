class Cat < ActiveRecord::Base

  has_many :audits
  after_save :tag_image, :if=>:image_url_changed?
  after_save :send_notification, :if => lambda { notification_email.present? && finished? }

  scope :finished, where('cropped_image_url IS NOT NULL')
  scope :rejected, where(:rejected => true)
  scope :pending, where('rejected = ? AND cropped_image_url IS NULL', false)

  validates :description, :presence=>true
  validates :notification_email, :presence=>true
  validates :image_url, :presence=>true
  validates :image_url, :format => { :with => /\.(png|jpg|gif)$/, :message => "should end with .jpg/.png/.gif" }

  def finished?
    cropped_image_url.present?
  end

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

  def send_notification
    CatMailer.summary_email(self).deliver
  end

end
