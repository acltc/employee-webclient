class Employee
  attr_accessor :first_name, :last_name, :email, :phone_numbers, :addresses, :birthdate, :manager

  def initialize(hash)
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @email = hash["email"]
    @phone_numbers = hash["phone_numbers"]
    @addresses = hash["addresses"]
    @birthdate = hash["birthdate"]
    @manager = hash["manager"]
  end
end