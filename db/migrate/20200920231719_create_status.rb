class CreateStatus < ActiveRecord::Migration[6.0]
  def change
    create_table :status do |t|
      t.string :description

      t.timestamps
    end
  end
end
