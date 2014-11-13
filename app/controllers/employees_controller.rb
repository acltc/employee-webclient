class EmployeesController < ApplicationController
  def index
    @employees = []
    api_employees = Unirest.get("http://localhost:3000/employees.json").body
    api_employees.each do |api_employee|
      @employees << Employee.new(api_employee)
    end
  end

  def show
    @employee = Employee.new(Unirest.get("http://localhost:3000/employees/#{params[:id]}.json").body)
  end


end
