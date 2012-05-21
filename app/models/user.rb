class User < ActiveRecord::Base
	has_attached_file :photo,
		:storage => :s3,
		:bucket => 'shared_workforce_demo',
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "/:style/:id/:filename"

  after_save :tag_photo, :if=>:photo_updated_at_changed?

  def tag_photo
  	TagPhotoTask.create(self)
  end
end
