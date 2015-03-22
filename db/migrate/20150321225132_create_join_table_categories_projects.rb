class CreateJoinTableCategoriesProjects < ActiveRecord::Migration
  def change
    create_join_table :categories, :projects
  end
end
