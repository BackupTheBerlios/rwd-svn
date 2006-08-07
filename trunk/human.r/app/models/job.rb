#
# $Id$
#
class Job < ActiveRecord::Base
  has_many :employees

  protected
    validates_uniqueness_of :title
    validates_presence_of :title
    validates_numericality_of :min_salary, :only_integer => true
    validates_numericality_of :max_salary, :only_integer => true
   
    validates_each :min_salary, :max_salary do | record, name, value |
      if value && (value < 0 || value > 999999)
        record.errors.add name, "Salary should be a positive number, maximum allowed is 999999!"
      end
    end

end

