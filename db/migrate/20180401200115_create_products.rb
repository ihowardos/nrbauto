class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title, null: false, default: ""
      t.text :description, null: false
      t.text :compatibility_model
      t.text :compatibility_oem
      t.text :category, null: false, default: "other"
    end
  end
end
