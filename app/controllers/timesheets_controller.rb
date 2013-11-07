class TimesheetsController < ApplicationController
  def create
    @timesheet = Timesheet.new(timesheet_params)
    if @timesheet.save
      flash[:success] = "Added New TimeSheet Successfully!"
      redirect_to :back
    else
      redirect_to employee_path
    end
  end
  
  def edit
    @timesheet = Timesheet.find(params[:id])
    @startdate = @timesheet.startdate.strftime("%B %e, %Y")
    
    @employee = Employee.find(@timesheet.employee_id)
  end
  
  def destroy
    Timesheet.find(params[:id]).destroy
    flash[:success] = "TimeSheet deleted."
    redirect_to :back
  end
  
private
  def timesheet_params
    params.require(:timesheet).permit(:employee_id, :startdate, :enddate, workdays_attributes: [:employee_id, :date, :timesheet_id])
  end
end
