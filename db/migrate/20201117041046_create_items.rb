class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,    null: false
      t.text       :address, null: false
      t.integer    :point,   null: false
      t.integer    :stock,   null: false, default: 1
      t.text       :comment, null: false
      t.references :user,    null: false, foreign_key: true
      t.float      :latitude
      t.float      :longitude
      t.timestamps
    end
  end
end
