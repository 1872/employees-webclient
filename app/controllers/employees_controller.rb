class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("http://localhost:3000/api/v1/employees.json").body
    render "index.html.erb"
  end

  def show
    @employee = Unirest.get("http://localhost:3000/api/v1/employees/#{params[:id]}.json").body
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @employee = Unirest.post(
      "http://localhost:3000/api/v1/employees",
      headers: { "Accept" => "application/json" },
      parameters: {
        first_name: params[:input_form_first_name],
        last_name: params[:input_form_last_name],
        email: params[:input_form_email]
      }
    ).body
    redirect_to "/employees/#{@employee['id']}"
  end
end
