class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :delete]
  def index
    @employees = Employee.all
  end

  def new 
    @employee = Employee.new
  end

  def create 
    @employee = Employee.create(employee_params(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url))
    if @employee.valid?
      redirect_to employee_path(@employee)
    else
      flash[:messages] = @employee.errors
      render :new
    end
  end

  def show 
  end

  def edit
  end

  def update
    @employee.update(employee_params(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url))
    if @employee.valid?
      redirect_to employee_path(@employee)
    else
      flash[:messages] = @employee.errors
      render :edit
    end
  end

  def destroy 
    @employee.destroy
    redirect_to employees_path
  end

private

def set_employee
  @employee = Employee.find(params[:id])
end

def employee_params(*args)
  params.require(:employee).permit(*args)
end
  
end
