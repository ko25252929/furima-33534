##テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| e-mai          | string | null: false |
| password       | string | null: false |
| streetaddress  | string | null: false |
| rist_name      | string | null: false |
| last_name      | string | null: false |
| rist_kana_name | string | null: false |
| last_kana_name | string | null: false |

##  items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| product_name | string     | null: false                    |
| price        | string     | null: false                    |
| producr_text | text       | null: false                    |
| user         | references | null: false, foreign_key: true |

##  buys テーブル

| Column            | Type       | Options                        |
| ----------------- | -----------| ------------------------------ |
| creditcard_number | string     | null: false                    |
| expliration_date  | string     | null: false                    |
| security_code     | string     | null: false                    |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |