require "employee"

class Startup
  attr_reader :name, :funding, :salaries
  def initialize(name, funding,salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end



end
