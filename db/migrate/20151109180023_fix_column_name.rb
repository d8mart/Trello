class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :homeworks, :author, :user_id
  end
end
