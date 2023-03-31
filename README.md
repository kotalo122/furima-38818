# テーブル設計

## users テーブル

| Column              | Type    | Options                  |
| ------------------- | --------| ------------------------ |
| nickname            | string  | null: false              |
| email               | string  | null: false unique: true |
| encrypted_password  | string  | null: false              |
| last_name           | string  | null: false              |
| first_name          | string  | null: false              |
| last_name_kana      | string  | null: false              |
| first_name_kana     | string  | null: false              |
| birthday            | date    | null: false              |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| discription     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| price           | integer    | null: false                    |
| shipping_fee_id | integer    | null:false                     |
| ship_from_id    | integer    | null: false                    |
| ship_days_id    | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |
<!-- imageはActiveStrageで実装するため含めない。 -->

### Association

- belongs_to :user
- has_one  :order 
- has_one  :shipping_information

## orders テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item                 | references | null: false  foreign_key: true |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :shipping_information

## shipping_information テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| post_code     | string     | null:false                     |
| prefecture_id | integer    | null:false                     |
| city          | string     | null:false                     |
| block         | string     | null:false                     |
| address       | string     | null:false                     |
| phone         | string     | null:false                     |

### Association

- belongs_to :order
- belongs_to :item