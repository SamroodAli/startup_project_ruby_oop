require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding,salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end

  def >(startup)
    @funding > startup.funding
  end

  def hire(name,position)
    if valid_title?(position)
      @employees << Employee.new(name,position)
    else
      raise Error
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    employee_salary = @salaries[employee.title]
    if @funding > employee_salary
      employee.pay(employee_salary)
      @funding -= employee_salary
    else
      raise Error
    end
  end

  def payday
    @employees.each {|employee| pay_employee(employee)}
  end


  def average_salary
   total_salary = @employees.reduce(0) { | total_salary, employee| total_salary = total_salary + @salaries[employee.title]}
   no_of_employees = @employees.length
   total_salary/no_of_employees
  end

end
