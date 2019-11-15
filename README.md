# README

## livevoice
画像付きで音楽イベントのレビューができるサイトです。転職活動用のポートフォリオとして作成致しました。

## 本番環境
ログイン画面からテストユーザーでログインが可能です。

https://livevoice000.herokuapp.com/reviews/9

## 機能一覧、使用gemなど
+ ユーザー登録,ログイン機能（device）
+ レビュー投稿機能(CRUD)
+ レビュー画像投稿機能(carrierwave)
+ レビューへのコメント機能
+ レビュー一覧表示の際などのページネーション機能(kaminari)
+ 名前、レビューの検索機能(ransack)
+ いいね機能

## 使用技術
+ Ruby 2.5.1
+ Ruby on Rails 5.2.3
+ psql (PostgreSQL) 11.5
+ SCSS,Bootstrap
+ GitHub,Git
+ Rspec
+ AWS(S3)

## テスト
+ Rspec
