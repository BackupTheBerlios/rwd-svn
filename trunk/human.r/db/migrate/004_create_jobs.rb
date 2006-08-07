#
# $Id$
#
class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.column :title, :string
      t.column :min_salary, :integer, :null => false
      t.column :max_salary, :integer, :null => false
    end
  end

  def self.down
    drop_table :jobs
  end
end
