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

  def update(input_options)
    employee_hash = Unirest.patch(
      "http://localhost:3000/api/v1/employees/#{id}.json",
      headers: { "Accept" => "application/json" },
      parameters: input_options
    ).body
    Employee.new(employee_hash)
  end

  def destroy
    Unirest.delete("http://localhost:3000/api/v1/employees/#{id}.json")
  end

  def self.all
    employee_hashes = Unirest.get("http://localhost:3000/api/v1/employees.json").body
    employees = []
    employee_hashes.each do |employee_hash|
      employees << Employee.new(employee_hash)
    end
    employees
  end

  def self.find_by(input_options)
    id = input_options[:id]
    employee_hash = Unirest.get("http://localhost:3000/api/v1/employees/#{id}.json").body
    Employee.new(employee_hash)
  end

  def self.create(input_options)
    employee_hash = Unirest.post(
      "http://localhost:3000/api/v1/employees",
      headers: { "Accept" => "application/json" },
      parameters: input_options
    ).body
    Employee.new(employee_hash)
  end
end