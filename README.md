# テーブル設計

## Users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| sei                | string  | null: false               |
| mei                | string  | null: false               |
| sei_kana           | string  | null: false               |
| mei_kana           | string  | null: false               |
| berthday           | integer | null: false               |

### Association
- has_many :items
- has_many :orders


## Items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| image         | string     | null: false                    |
| text          | string     | null: false                    |
| category      | string     | null: false                    |
| status        | text       | null: false                    |
| shipping_fee  | string     | null: false                    |
| area          | text       | null: false                    |
| lead_time     | text       | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## Shippings テーブル

| Column        | Type    | Options                   |
| ------------- | ------- | ------------------------- |
| postal_code   | string  | null: false               |
| prefecture    | string  | null: false               |
| city          | string  | null: false               |
| address_line1 | string  | null: false               |
| address_line2 | string  | null: true                |
| phone_number  | integer | null: false               |


### Association
- belongs_to :order


## Orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |
| shipping      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping