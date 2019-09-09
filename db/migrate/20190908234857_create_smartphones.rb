class CreateSmartphones < ActiveRecord::Migration[5.2]
  def change
    create_table :smartphones do |t|

      t.timestamps
    end
  end
end
