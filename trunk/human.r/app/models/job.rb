#
# $Id$
#
class Job < ActiveRecord::Base
  has_many :employees

  protected
    validates_uniqueness_of :title
    validates_presence_of :title, :min_salary, :max_salary
   
    validates_each :min_salary, :max_salary do | record, name, value |
      if (value && (value.to_s =~ /^[+-]?\d+$/)) && (value.to_i < 0 || value.to_i > 999999)
        record.errors.add name, "should be a positive number, [0-999999]!"
      end
    end

end

