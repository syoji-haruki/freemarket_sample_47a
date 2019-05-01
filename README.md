# README
Name
====
freemarket_sample_47a(Tech Expert Final topic, Copy existing site)

## Demo
![メルカリログイン3](https://user-images.githubusercontent.com/47352093/56954167-1e97f200-6b79-11e9-9e59-c37dc10f5913.gif)

[![Image from Gyazo](https://i.gyazo.com/3fb49983a9d7ccd378c1109ea90e7878.gif)](https://gyazo.com/3fb49983a9d7ccd378c1109ea90e7878)

[![Image from Gyazo](https://i.gyazo.com/8bfe646471e574213063e7abc87258ae.gif)](https://gyazo.com/8bfe646471e574213063e7abc87258ae)

[![Image from Gyazo](https://i.gyazo.com/fad84f989502dd758e93cde95e0e3936.gif)](https://gyazo.com/fad84f989502dd758e93cde95e0e3936)

## Overview
- New user registration, login, logout
- Product listing, edit, delete
- Product list display, details display
- Credit card registration, product purchase
- Category, brand function
- Slide show
- Breadcrumb
- Product Search


## Description
- New user registration, login, logout-Access restriction by bot by recaptcha. Login with facebook, google account by omniauth (only works in local environment)
- Product listing, edit, delete-Product images can be posted by multiple images simultaneously, selected by drag and drop
- Product list display, details display-The list page (top page) shows specific categories and brands. Products can be purchased from the detail page
- Credit card registration, product purchase-Implements payment function using payjp
- Category, brand function-The category and brand are linked to the product but can not be used in the search
- Slide show-Implement slide on top page
- Breadcrumb-Implement breadcrumbs using gretel
- Product Search-I used ransack. You can search by keyword from the header search window

## Development period
About 4 weeks

## データベース設計
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 2.5.1p57
* Rails version
Rails 5.0.7.2

* DB設計補足
uservaluationsテーブル、commentsテーブル、brandsテーブルは構想のみ。

### usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|index: true, null: false|
|email|string|null: false, unique:true|
|encrypted_password|string|null: false, default: ""|
|reset_password_token|string|
|reset_password_sent_at|datetime|
|remember_created_at|datetime|
|lastname|string|
|firstname|string|
|lastnamekana|string|
|firstnamekana|string|
|birthyear|integer|
|birthmonth|integer|
|birthday|integer|

<!-- passより下のカラムはdeviseで自動で作成される -->

#### Association
- has_many :items
- has_many :trades
- has_many :cards
- has_many :comments
- has_many :uservaluations,foreign_key: "evaluateduser_id", class_name: "Uservaluation"
- has_one  :profile,dependent: :destroy
- has_one  :phonenumber,dependent: :destroy
- has_many :snsCredentials, dependent: :destroy

### SnsCredentialsテーブル

|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string|
|user|references|

#### Association
- belongs_to :user

### cardsテーブル

|Column|Type|Options|
|------|----|-------|
|pay_id|string|
|customer_id|string|
|user|references|

#### Association
- belongs_to :user

### prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


- active hashのみ使用

### profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|      |
|postnumber|string|null: false|
|shikuchouson|string|null: false|
|banchi|string|null: false|
|tatemonomei|string||
|user|references|
|lastname|string|
|firstname|string|
|lastnamekana|string|
|firstnamekana|string|
|prefecture|string|
|phonenumber|string|

#### Association
- belongs_to :user

### phonenumbersテーブル

|Column|Type|Options|
|------|----|-------|
|phonenumber|string|null: false|
|user|references|


#### Association
- belongs_to :user

### itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true,null: false|
|description|text|null: false|
|trade_status|string|null: false|
|price|string|null: false|
|user|references|null: false|
|item_conditon|string|null: false|
|category|references|null: false|
|brand|references|null: false|
|saizu|string|null: false|

<!-- saizuはsizeのこと。予約語回避のため -->

#### Association
- belongs_to :user
- has_one  :trade
- has_many :images
- belongs_to :brand
- belongs_to :category
- accepts_nested_attributes_for :images,allow_destroy: true
- accepts_nested_attributes_for :trade,update_only: true

### tradesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|  |
|buyer|references|  |
|postage|string|null: false|
|delivery|string|null: false|
|region|string|null: false|
|shipping_date|string|null: false|

<!-- postage(配送料の負担),delivery(配送方法),region(発送元地域),shipping_date(発送までの日数) -->

#### Association
- belongs_to :item, optional: true
- belongs_to :buyer,class_name: "User",optional: true


### imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|    |
|image|string|    |

#### Association
- belongs_to :item, optional: true

### categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|
|parent|references|    |


#### Association
- belongs_to :parent, class_name: :Category, optional: true
- has_many :children, class_name: :Category, foreign_key: :parent_id

### brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|


#### Association
- has_many :items


### commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|      |
|item|references|      |
|text|text|null: false|

#### Association
- belongs_to :item
- belongs_to :user

### uservaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|evaluateduser|references|    |
|evaluater|references|    |
|kind|string|    |

#### Association
- belongs_to :evaluateduser, class_name: "User"
- belongs_to :evaluater, class_name: "User"

## Author
[usualpn0221](https://github.com/usualpn0221) </br>
[syoji-haruki](https://github.com/syoji-haruki) </br>
[orangina92](https://github.com/orangina92) </br>
[takumiKATAOKA](https://github.com/TakumiKATAOKA)

