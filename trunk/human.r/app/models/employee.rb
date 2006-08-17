#
# $Id$
#
class Employee < ActiveRecord::Base
  belongs_to :department
  belongs_to :job

  def to_s
    first_name + ' ' + last_name    
  end
  
  protected

    validates_uniqueness_of :email
    validates_inclusion_of :salary, :within=> 200..999999
    validates_presence_of :last_name, :first_name, :email
    validates_length_of :commission, :maximum => 2

    validate :commission_percent

  private
    
    def commission_percent
    end

end

