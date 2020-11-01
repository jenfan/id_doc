class AddCategoryToDocument < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :category_id, :integer
  end
end
