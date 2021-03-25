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

end
