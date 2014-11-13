class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("http://localhost:3000/employees.json").body
  end

  def show
    @employee = Employee.new(Unirest.get("http://localhost:3000/employees/#{params[:id]}.json").body)
  end


end
