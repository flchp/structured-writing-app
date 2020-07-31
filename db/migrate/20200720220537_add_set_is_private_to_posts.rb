class AddSetIsPrivateToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :set_is_private, :boolean, default: false
  end
end
