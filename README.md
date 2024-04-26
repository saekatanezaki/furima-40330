# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# users table
|Column               |Type    |Options     |
|--------------------|---------|------------|
|name                |string   |null: false |
|email               |string   |null: false |unique: true|
|encrypted_password  |string   |null: false |
|last_name           |string   |null: false |
|first_name          |string   |null: false |
|first_name_kana     |string   |null: false |
|last_name_kana      |string   |null: false |
|birthday            |date     |null: false |

- has_many :items
- has_many :orders


# items table

|Column              |Type       |Options     |
|--------------------|---------- |------------|
|item_name           |string     |null: false |
|content             |text       |null: false |
|price               |integer    |null: false |
|category            |active_hash|null: false |
|status              |active_hash|null: false |
|shipping_status     |active_hash|null: false |
|item_prefecture     |string     |null: false |
|scheduled_delivery  |active_hash|null: false |
|user                |references|foreign_key: true, null: false　|

class CreateArticles < ActiveRecord::Migration[7.0]
 def change
   create_table :articles do |t|
     t.text     :category        , null: false
     t.text       :status         , null: false
     t.string    :shipping_status    , null: false
     t.text      :item_prefecture    ,null: false
   end
 end
end

- belongs_to: user
- has_one: order



# orders table

|Column              |Type        |Options                       |
|--------------------|------------|------------------------------|
|user                |references  |foreign_key: true, null: false|
|item                |references  |foreign_key: true, null: false|

- belongs_to: item
- has_one: address
- belongs_to: user




# addresses table

|Column              |Type        |Options     |
|--------------------|------------|------------|
|zip_code            |string      |null:false  |
|prefecture          |string      |null: false |
|city                |string      |null: false |
|addresses           |string      |null: false |
|building            |string      |
|phone_number        |string      |null: false |
|order               |references  |foreign_key: true, null: false|
#active_hashはread meに記載されているという記述が見つからないのでここはカテゴリーの選択を工夫しように記述されている通り今後modelを作成し、個別に書く

- has_one: order




