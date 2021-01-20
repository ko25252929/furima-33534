##テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_kana_name    | string | null: false              |
| last_kana_name     | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :Product_purchase_histories 

##  items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| price            | integer    | null: false                    |
| text             | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| cost_id          | integer    | null: false                    |
| prefectures_id   | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :product_purchase_history



##  buys テーブル

| Column                   | Type       | Options                        |
| ------------------------ | -----------| ------------------------------ |
| postal_code              | string     | null: false                    |
| prefectures_id           | integer    | null: false                    |
| city                     | string     | null: false                    |
| address                  | string     | null: false                    |
| building_name            | string     |                                |
| phone_number             | string     | null: false                    |
| product_purchase_history | references | null: false, foreign_key: true |


### Association
- belongs_to :Product_purchase_history


##  product_purchase_histories テーブル

| Column | Type       | Options                        |
| -------| -----------| ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| buy    | references | null: false, foreign_key: true |

### Association
- belongs_to :user 
- belongs_to :item 
- has_one :buy 