class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  def index
    @employees = Employee.all
  end

  def search
    @employees = Employee.where("employee_name LIKE ?", "%#{params[:query].strip}%")
    if @employees
      render :index
    else
      @msg = "No Results found."
      render :index
    end
  end

  def new
    @employee = Employee.new
    @employee.locations.build
  end

  def create
    @employee = Employee.new(employee_params)
    debugger
    if @employee.save
      redirect_to employees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    render :index
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:id, :employee_name, :email, :gender, :mobile_number, :birth_date, :hobbies, :document, locations_attributes: [:house, :society, :road, :area, :city, :pincode])
  end
end
