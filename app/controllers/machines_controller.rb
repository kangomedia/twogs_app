class MachinesController < ApplicationController
  before_action :signed_in_user
  
  def index
    @machines = Machine.all
  end

  def new
    @machine = Machine.new
    @machine.attachments.build
    @machine.machine_metas.build.build_attachment
  end

  def show
    @machine = Machine.find(params[:id])
  end

  def create
    @machine= Machine.new(machine_params)
    
    if @machine.save
      flash[:success] = "Added New Equipment Successfully!"
      redirect_to machines_path
    else
      render 'index'
    end
  end

  def destroy
    Machine.find(params[:id]).destroy
    flash[:success] = "Equipment deleted."
    redirect_to machines_url
  end
  
  def edit
    @machine = Machine.find(params[:id])
    @machine.attachments.build
    @machine.machine_metas.build.build_attachment
  end
  
  def update
    @machine = Machine.find(params[:id])
    if @machine.update_attributes(machine_params)
      flash[:success] = "Equipment updated"
      redirect_to edit_machine_path(@machine)
    else
      render 'edit'
    end    
  end
  
private
  def machine_params
    params.require(:machine).permit(:make, :model, :year, :serial, :status, machine_metas_attributes: [:id, :meta_value, :meta_key, :_destroy, attachment_attributes: [:id, :file]], attachments_attributes: [:id, :file])
  end
end
