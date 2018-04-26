class User < ActiveRecord::Base
  # バリデート設定
  validates :nickname, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many  :reviews

  # has_attached_file :カラム名,
                    # styles:  { medium: "画像サイズ", thumb: "画像サイズ" }
  # サイズを指定するための属性はstyles。
  # stylesではどのような種類の画像をどの大きさで保存するか指定する。
  # 「medium」や「thumb」はImageMagickで保存できる画像の種類です。
  # 画像サイズの指定はImageMagickでの指定方法に準じる。
  has_attached_file :avatar,
                    styles:  { medium: "300x300#", thumb: "100x100#" }

  # validates_attachment_content_type :カラム名,
                                    # content_type: ["画像の種類"]
  # ["画像の種類"]には、配列で指定する。
  validates_attachment_content_type :avatar,
                                    content_type: ["image/jpg","image/jpeg","image/png"]



end
