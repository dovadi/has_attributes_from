class CreateEmployeeProperties < ActiveRecord::Migration
  def self.up
    create_table :employee_properties do |t|
      t.integer :reports_to
      t.string  :department
      t.integer :employee_id

      t.timestamps
    end
  end

  def self.down
    drop_table :employee_properties
  end
end
