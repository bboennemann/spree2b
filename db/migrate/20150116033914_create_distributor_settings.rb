class CreateDistributorSettings < ActiveRecord::Migration
  def change
    create_table :distributor_settings do |t|
      t.integer :margin_value
      t.integer :margin_percentage
      t.integer :margin_min
      t.integer :margin_max
      t.date :order_cut_off
      t.date :file_check_time

      t.timestamps
    end
  end
end
