# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

## Association
 has_many :items, dependent: :destroy
 has_one :purchases

##  itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| cost        | string     | null: false                    |
| area        | string     | null: false                    |
| days        | string     | null: false                    |
| price       | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |

## Association
 belongs_to :users

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

## Association
belongs_to :users