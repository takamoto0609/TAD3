class CreateChangePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :change_points do |t|
      t.integer    :point
      t.string     :pass,    null: false, unique: true
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
