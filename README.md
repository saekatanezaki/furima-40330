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
|name|string|false|
|email|string|false|
|encrypted_password|string|false|
|last_name|string|false|
|first_name|string|false|
|first_name_kana|string|false|
|last_name_kana|string|false|

# items table

|Column|Type|Options|
|item_name|string|false|
|price|integer|false|
|description|string|false|
|Column|Type|Options|
|user|references|false|foreign_key|

# orders table

|Column|Type|Options|
|user|references|false|foreign_key|
|user|references|false|foreign_key|
|phone_number|integer|false|


