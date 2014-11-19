class Employee

  attr_accessor :first_name, :last_name, :email, :phone_numbers, :addresses, :ssn, :id

  def initialize(hash)
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @email = hash["email"]
    @phone_numbers = hash["phone_numbers"]
    @addresses = hash["addresses"]
    @ssn = hash["ssn"]
    @id = hash["id"]
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def self.find(id)
    Employee.new(Unirest.get("#{ENV["EMPLOYEE_API_ROOT"]}/employees/#{id}.json").body)
  end

  def self.all
    employees = []
    raw_employees_data = Unirest.get("#{ENV["EMPLOYEE_API_ROOT"]}/employees.json").body
    raw_employees_data.each do |employee_hash|
      employees << Employee.new(employee_hash)
    end
    employees
  end

  def destroy
    Unirest.delete("#{ENV["EMPLOYEE_API_ROOT"]}/employees/#{@id}.json", headers: {"Accept" => "application/json"})
  end

end

# def first_name
#   return @first_name
# end

# def first_name=(name)
#   @first_name = name
# end


# Employee.new({"first_name" => "Emily", "last_name" => "Post"})