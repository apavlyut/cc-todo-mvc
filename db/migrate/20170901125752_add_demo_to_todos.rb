class AddDemoToTodos < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :demo, :text
  end
end
