class CreateCoaches < ActiveRecord::Migration[7.1]
  def change
    create_table :coaches do |t|
      t.string :first_name
      t.string :last_name
      t.string :slug

      t.timestamps
    end
  end
end
