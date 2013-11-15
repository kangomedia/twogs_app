class MachineMetasController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def add_image
  end 
  
  def delete
    @delete_machine = MachineMeta.where(id: params[:machine_meta_ids]).delete_all
    if @delete_machine
      flash[:success] = "Equipment part was successfully deleted."
      redirect_to :back
    end
  end
end
