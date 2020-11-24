class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.integer    :point,   null: false
      t.references :user,    null: false, foreign_key: true
      t.string     :reason,  null: false
      t.timestamps
    end
  end
end
