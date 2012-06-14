class AddPromotedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :promoted, :boolean, default: false
  end
end
