class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
  mount_uploader :file, AttachmentUploader
  
private

  def attachment_params
    params.require(:attachment).permit(:file, :attachable_id, :attachable_type)
  end
end
