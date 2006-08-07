#
# $Id$
#
class RemoveDepartmentManager < ActiveRecord::Migration

  def self.up
    remove_column Department.table_name, :manager_id
  end

  def self.down
    add_column Department.table_name, :manager_id, :integer, :null=>false
  end

end

