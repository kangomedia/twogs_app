class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  has_attached_file :file, :styles => { 
    :small => "50x50>", 
    :thumb => "100x100>", 
    :medium => "300x300>" 
  }, 
    :default_url => "/images/default_avatar.png", 
    :storage => :s3, 
    :s3_credentials => { 
      :access_key_id => "AKIAJYBWNPT3XLVRPGJA", 
      :secret_access_key => "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" 
    }, 
    :bucket => "2gsapp"

private
  def attachment_params
    params.require(:attachment).permit(:file)
  end
end
