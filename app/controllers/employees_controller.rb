class EmployeesController < ApplicationController
  def show
    @employee = Unirest.get("http://localhost:3000/employees/#{params[:id]}.json").raw_body
  end
end
