class User < ActiveRecord::Base
	has_attached_file :photo,
		:storage => :s3,
		:path => "/:style/:id/:filename",
    :s3_credentials => {
    	:access_key_id => ENV['S3_KEY'],
    	:secret_access_key => ENV['S3_SECRET'],
    	:bucket => ENV['S3_BUCKET']
    }
    
  after_save :tag_photo, :if=>:photo_updated_at_changed?

  def tag_photo
  	TagPhotoTask.create(self)
  end
end
