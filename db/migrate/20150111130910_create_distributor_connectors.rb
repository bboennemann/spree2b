class CreateDistributorConnectors < ActiveRecord::Migration
  def change
    create_table :distributor_connectors do |t|

      t.timestamps
    end
  end
end
