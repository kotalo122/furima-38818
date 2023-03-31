# テーブル設計

## users テーブル

| Column              | Type    | Options                  |
| ------------------- | --------| ------------------------ |
| nickname            | string  | null: false              |
| email               | string  | null: false unique: true |
| encrypted_password  | string  | null: false              |
| last_name           | text    | null: false              |
| first_name          | text    | null: false              |
| last_name_kana      | string  | null: false              |
| first_name_kana     | string  | null: false              |
| birthday_year       | integer | null: false              |
| birthday_month      | integer | null: false              |
| birthday_day        | integer | null: false              |


### Association

- belongs_to :item
- belongs_to :oder

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| discription  | text       | null: false                    |
| category     | string     | null: false                    |
| price        | integer    | null: false                    |
| shipping_fee | integer    | null:false                     |
| ship_from    | string     | null: false                    |
| ship_days    | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |
<!-- imageはActiveStrageで実装するため含めない。 -->

### Association

- has_many :users
- has_one  :oder 
- has_one  :shipping_information

## orders テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| item_id                 | references | null: false  foreign_key: true |
| user_id                 | references | null: false, foreign_key: true |
| shipping_information_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :shipping_information

## shipping_information テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| post_code  | integer    | null:false                     |
| prefecture | string     | null:false                     |
| city       | string     | null:false                     |
| block      | string     | null:false                     |
| address    | string     | null:false                     |
| phone      | integer    | null:false                     |

### Association

- belongs_to :order
- belongs_to :items
