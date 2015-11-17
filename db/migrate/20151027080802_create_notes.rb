class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title   # タイトル
      t.text :content   # 内容

      t.timestamps null: false
    end
  end
end
