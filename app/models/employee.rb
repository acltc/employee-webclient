class Employee

  attr_accessor :first_name, :last_name, :email, :phone_numbers, :addresses, :ssn

  def initialize(hash)
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @email = hash["email"]
    @phone_numbers = hash["phone_numbers"]
    @addresses = hash["addresses"]
    @ssn = hash["ssn"]
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def self.find(id)
    Employee.new(Unirest.get("http://localhost:3000/employees/#{id}.json").body)
  end

  def self.all
    employees = []
    raw_employees_data = Unirest.get("http://localhost:3000/employees.json").body
    raw_employees_data.each do |employee_hash|
      employees << Employee.new(employee_hash)
    end
    employees
  end

end

# def first_name
#   return @first_name
# end

# def first_name=(name)
#   @first_name = name
# end


# Employee.new({"first_name" => "Emily", "last_name" => "Post"})