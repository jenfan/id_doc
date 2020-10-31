class CreateDocFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :doc_files do |t|
      t.binary :data,         :null => false
      t.string :filename
      t.string :mime_type

      t.timestamps
    end
  end
end
