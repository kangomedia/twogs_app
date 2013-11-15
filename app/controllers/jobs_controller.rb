class JobsController < ApplicationController
  def index
    @job = Job.new
    @jobs = Job.all
  end
  
  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "Job added successfully."
      redirect_to jobs_path
    end
  end
  
  def edit
    @job = Job.find(params[:id])
  end
  
  def delete
    Job.where(id: params[:job_ids]).delete_all
    flash[:success] = "Job successfully deleted."
    redirect_to jobs_path
  end
  
private
  def job_params
    params.require(:job).permit(:number, :name)
  end
end
