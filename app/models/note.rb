class Note < ActiveRecord::Base
	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :liking_users, through: :likes, source: :user

	# # photoをattachファイルとする。stylesで画像サイズを定義できる
	has_attached_file :photo, styles: { medium: "300*300>", thumb: "100*100>" }

	validates :title, presence: true
	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true
	# ファイルの拡張子を指定（これがないとエラーが発生する）
	validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
