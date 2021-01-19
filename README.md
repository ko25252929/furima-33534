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
| birthday           | string | null: false              |

### Association

- has_many :item
- has_many :buy

##  items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| product_name      | string     | null: false                    |
| price             | string     | null: false                    |
| product_text      | text       | null: false                    |
| product_category  | string     | null: false                    |
| product_condition | string     | null: false                    |
| delivery_cost     | string     | null: false                    |
| shipping_area     | string     | null: false                    |
| shipping_days     | string     | null: false                    |
| user              | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_many :buy


##  buys テーブル

| Column        | Type       | Options                        |
| --------------| -----------| ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item