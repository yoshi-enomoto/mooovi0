# Mooovi0

映画のレビューを投稿するアプリケーション

## 機能
- レビュー投稿機能
- 投稿作品の検索機能（非同期通信）
- ユーザー登録機能

## 追加機能・要素
- 監督名での検索投稿機能（非同期通信）
- 作品の新規投稿機能
- 作品の詳細情報表示機能
- マイページでの作品からのレビューページへのリンク機能
- 他ユーザーのマイページへのリンク機能
- ユーザーアイコン変更ページへのリンク機能
- ログイン・サインアップ・パスワード忘れ画面の修正

## 特記事項
- 画像アップロード用に『paperclip』を使用しており、web上にcloudinaryとの連動法がない為、本番環境でもローカルにアイコン画像を保存（数時間で消えてしまう）
- 作品の新規投稿時、リメイク作品などを考慮した体で、タイトルにユニーク制約は設定していない。
- Reviewsテーブルの『user』のみ、migrationファイルで外部キー想定して作成。
- 個人的復習、振り返りを兼ねて、随所にコメントを追記。


# Structure of DataBase

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|unique: true|
|password|string|null: false|
|nickname|text|null: false|
|avatar|attachment||

### Association
```
- has_many :reviews
```


## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index: true|
|image_url|text||
|director|string|null: false|
|detail|text||
|open_date|string||

### Association
```
- has_many :reviews
```


## Reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|review|text||
|rate|integer|null: false|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
```
- belongs_to :user
- belongs_to :product
```
