class AttachmentsController < ApplicationController
  before_filter :load_attachable
  
  def index
    @attachments = @attachable.attachments
  end

  def new
  end
  
private

  def attachment_params
    params.require(:attachment).permit(:file)
  end
  
  def load_attachable
    resource, id = request.path.split('/')[1, 2]
    @attachable = resource.singularize.classify.constantize.find(id)
  end
  
end
