class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :external_id
      t.belongs_to :document

      t.timestamps
    end
  end
end
