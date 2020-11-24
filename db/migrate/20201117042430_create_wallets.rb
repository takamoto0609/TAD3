class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.integer    :point,   null: false, default: 100
      t.references :user,    null: false, foreign_key: true
      t.string     :reason,  null: false, default: "初回お試し"
      t.timestamps
    end
  end
end
