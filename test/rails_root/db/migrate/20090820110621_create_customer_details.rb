class CreateCustomerDetails < ActiveRecord::Migration
  def self.up
    create_table :customer_details do |t|
      t.string  :phone
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :customer_details
  end
end
