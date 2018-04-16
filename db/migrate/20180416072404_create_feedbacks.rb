class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :full_name
      t.string :email
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
