class AddReponsesToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :create_response, :jsonb
    add_column :tasks, :get_response, :jsonb
  end
end
