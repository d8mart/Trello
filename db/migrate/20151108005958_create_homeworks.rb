class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :title
      t.text :description
      t.time :duration
      t.date :start_date
      t.date :end_date
      t.string :author
      t.boolean :status

      t.timestamps null: false
    end
  end
end
