class AddIsJobToPost < ActiveRecord::Migration
  def change
    add_column :posts, :is_job, :boolean, default: false, null: false
  end
end
