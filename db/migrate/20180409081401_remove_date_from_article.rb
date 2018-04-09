class RemoveDateFromArticle < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :date
  end
end
