class ChangeBodyTypeInPosts < ActiveRecord::Migration
  def change
     change_column :homeworks, :author, :integer
  end
end
