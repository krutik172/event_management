class EmployeesController < ApplicationController

    before_action :set_employee, only: %i[ show edit update destroy ]
    def index 
        @employees = Employee.all
    end


    def search

    end

    def new 
        @employee = Employee.new
    end

    def create 
        @employee = Employee.new(employee_params)
        if @employee.save 
            redirect_to employees_path
        else 
            render :new, status: :unprocessable_entity
        end
    end

    def edit 
    end

    def update 
    end

    def show 
    end

    def destroy 
    end

    private 

    def set_employee 
        @employee = Employee.find(params[:id])
    end

    def employee_params 
        params.require(:employee).permit(:id, :employee_name, :email, :gender, :mobile_number, :birth_date, :hobbies, :document, addresses_attributes: [:house, :society, :road, :area, :city, :pincode])
    end
end
