# Mooovi

映画のレビューを投稿するアプリケーション

## 機能
- レビュー投稿機能
- ユーザー登録機能

## 追加機能

## 特記事項
- html,cssは既存のものを引用し、htmlをhamlに書き直す（予定）
- 外部キーを想定して作成（予定）
- 個人的復習、振り返りを兼ねて、随所にうっとおしいくらいコメントを追記。（予定）


# Structure of DataBase

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|unique: true|
|password|string|null: false|
|nickname|text||
|avatar|attachment||

### Association
- has_many :reviews


## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|image_url|text|null: false|
|director|string|null: false|
|detail|text|null: false|
|open_date|string|null: false|

### Association
- has_many :reviews


## Reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|review|text|null: false|
|rate|integer|null: false|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
