class CreateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :codes do |t|
      t.integer    :point,   null: false
      t.string     :pass,    null: false, unique: true
      t.boolean    :used,    null: false, default: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
