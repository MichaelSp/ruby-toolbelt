class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.float :popularity
      t.string :website
      t.string :rdoc
      t.string :wiki
      t.string :source_code
      t.string :bug_tracker
      t.string :mailing_list
      t.integer :downloads
      t.integer :releases
      t.string :latest_version
      t.datetime :released_at
      t.datetime :first_released_at
      t.integer :depending_gems
      t.string :github
      t.integer :watchers
      t.integer :forks
      t.float :activity
      t.datetime :last_commit_at
      t.datetime :first_commit_at
      t.string :contributors
      t.integer :issues

      t.timestamps null: false
    end
  end
end
