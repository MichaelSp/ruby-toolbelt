class AddErrorFieldToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :error_message, :text
  end
end
