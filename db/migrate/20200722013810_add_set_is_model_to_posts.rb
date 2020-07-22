class AddSetIsModelToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :set_is_model, :boolean, default: false
  end
end
