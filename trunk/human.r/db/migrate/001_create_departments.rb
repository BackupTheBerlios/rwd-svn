#
# $Id$
#
class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.column :location_id, :integer, :null => false
      t.column :manager_id, :integer, :null => false
      t.column :name, :string, :null => false
    end
  end

  def self.down
    drop_table :departments
  end
end
