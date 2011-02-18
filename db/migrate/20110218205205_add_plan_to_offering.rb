class AddPlanToOffering < ActiveRecord::Migration
  def self.up
    add_column :offerings, :plan_id, :integer
  end

  def self.down
    remove_column :offerings, :plan_id
  end
end
