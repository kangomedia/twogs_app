class Assignment < ActiveRecord::Base
  validates :hours, presence: true
  
  def assignment_sum
    Assignment.sum(:hours).group(:job_id)
  end
end
