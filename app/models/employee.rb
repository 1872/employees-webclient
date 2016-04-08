class Employee
  attr_accessor :id, :first_name, :last_name, :email, :birthdate, :addresses

  def initialize(input_options)
    @id = input_options["id"]
    @first_name = input_options["firstName"]
    @last_name = input_options["lastName"]
    @email = input_options["email"]
    @birthdate = input_options["birthDate"]
    @addresses = input_options["theAddresses"]
  end

  def fancy_name
    "#{first_name} #{last_name}, Esquire"
  end
end