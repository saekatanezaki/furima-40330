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

|Column|Type|Options|
|name|string|null: false|
|email|string|null: false|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|integer|null: false|
|has_many: items, orders|

# items table

|Column|Type|Options|
|item_name|string|null: false|
|content|string|null: false|
|price|integer|null: false|
|category|string|null: false|
|status|string|null: false|
|shipping_status|string|null: false|
|item_prefecture|string|null: false|
|scheduled_delivery|integer|null: false|
|user_id|integer|null: false|
|belongs_to: user|
|has_one: order|




# orders table

|Column|Type|Options|
|user_id|integer|null: false|
|item_id|integer|null: false|
|belongs_to: item|
|belongs_to: user|
|has_one: item|
|has_one: user|



# address table

|Column|Type|Options|
|card_number|integer|null: false|
|expire_date|integer|null: false|
|security_code|integer|null: false|
|zip_code|string|null:false|
|address|string|null:false|
|prefecture|string|null: false|
|city|string|null: false|
|addresses|string|null: false|
|building|string|null: false|
|phone_number|integer|null: false|




