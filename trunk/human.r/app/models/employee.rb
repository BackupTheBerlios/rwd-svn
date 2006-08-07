#
# $Id$
#
class Employee < ActiveRecord::Base
  belongs_to :department
  belongs_to :job

  protected

    validates_uniqueness_of :email
    validates_length_of :commission, :maximum => 2
    validates_numericality_of :salary

    validates_each :salary do | record, name, value |
      if value && (value < 0 || value > 999999)
        record.errors.add name, "Salary should be a positive number, maximum is 999999!"
      end
    end

    validate :commission_percent

  private
    
    def commission_percent
    end

end

