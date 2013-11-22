class Document < ActiveRecord::Base
  belongs_to :machine
  has_attached_file :pdf,
  :storage => :s3, 
  :s3_credentials => { 
    :access_key_id => "AKIAJYBWNPT3XLVRPGJA", 
    :secret_access_key => "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" 
  }, 
  :bucket => "2gsapp"
  
  validates :pdf,    presence: true
end
