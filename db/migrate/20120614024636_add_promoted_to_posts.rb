class AddPromotedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :promoted, :boolean
  end
end
