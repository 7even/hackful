class AddPostSnippet < ActiveRecord::Migration
  def change
    add_column :posts, :snippet, :string
  end
end
