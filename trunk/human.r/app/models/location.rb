#
# $Id$
#
class Location < ActiveRecord::Base
  has_many :departments

  def to_s
    "#{city} - #{street} (#{code})"
  end

  protected
    
    validates_length_of   :code,   :maximum => 12
    validates_length_of   :street, :maximum => 12
    validates_presence_of :city

end

