class CreateClassificationTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :classification_types do |t|
      t.string :name
      t.string :slug
      t.boolean :base

      t.timestamps
    end
  end
end
