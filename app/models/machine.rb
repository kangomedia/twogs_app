class Machine < ActiveRecord::Base
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :machine_metas, dependent: :destroy
  
  accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :machine_metas, :allow_destroy => true, :reject_if => :all_blank
  
  validates :make,    presence: true
  validates :model,   presence: true
end
