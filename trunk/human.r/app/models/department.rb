#
# $Id$
#
class Department < ActiveRecord::Base
  belongs_to :location
  has_many :employees
  
  protected
    validates_presence_of :name
    validates_uniqueness_of :name
    validates_presence_of :location

end
