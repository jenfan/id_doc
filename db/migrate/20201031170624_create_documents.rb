class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :task_id
      t.integer :doc_file_id

      t.timestamps
    end
  end
end
