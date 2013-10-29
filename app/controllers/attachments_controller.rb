class AttachmentsController < ApplicationController
  
private
  def attachment_params
    params.require(:attachment).permit(:file)
  end
end
