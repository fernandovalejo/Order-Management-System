class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :status
      t.string :control_number
      t.string :description

      t.timestamps
    end
  end
end
