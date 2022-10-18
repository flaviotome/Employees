class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /employees or /employees.json
  def index
    @employees = Employee.all

    @q = Employee.ransack(params[:q])
    @employees = @q.result(distinct: true)
  end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }

        #notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
        #  defaults channel: "#geral",
        #           username: "Employee Bot"
        #end
        
       # notifier.ping "Teste"
       #require 'slack-messenger'

       messenger = Slack::Messenger.new "https://hooks.slack.com/services/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" do
        defaults channel: "geral",
                 username: "messenger"
      end
      
      messenger.ping "agora vai"
      

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:emp_name, :emp_email, :emp_job, :emp_salary)
    end
end
