class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,    null: false
      t.string     :place,   null: false
      t.integer    :point,   null: false
      t.integer    :stock,   null: false, default: "1"
      t.text       :comment, null: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
