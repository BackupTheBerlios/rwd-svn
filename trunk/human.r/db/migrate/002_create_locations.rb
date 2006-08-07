#
# $Id$
#
class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.column :street, :string, :null => false
      t.column :code, :integer, :null => false
      t.column :city, :string, :null => false
    end
  end

  def self.down
    drop_table :locations
  end
end
