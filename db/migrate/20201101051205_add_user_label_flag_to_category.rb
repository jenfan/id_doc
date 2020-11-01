class AddUserLabelFlagToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :classification_types, :user_label, :boolean
  end
end
