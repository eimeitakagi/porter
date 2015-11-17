class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name        # ユーザー名
      t.string :email       # メールアドレス
      t.integer :grade      # 学年
      t.string :language    # 言語
      t.string :job         # 興味のある業種

      t.timestamps null: false
    end
  end
end
