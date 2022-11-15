# テーブル設計

## users テーブル

| Column             | Type   | Options                         |
| ------------------ | ------ | ------------------------------- |
| nickname           | string | null: false                     |
| email              | string | null: false unique: true        |
| encrypted_password | string | null: false                     |
| family_name        | string | null: false                     |
| first_name         | string | null: false                     |
| family_name_kana   | string | null: false                     |
| first_name_kana    | string | null:false                      |
| birth_day          | date   | null: false                     |


### Association

- has_many :orders dependent: :destroy
- has_many :destinations dependent: destroy
- has_many :items dependent: destroy


## destinationsテーブル

| Column             | Type      | Options                      |
| ------------------ | --------- | -----------------------------|
| post_code          | string    | null: false                  |
| prefecture         | integer   | null: false                  |
| city               | string    | null: false                  |
| address            | string    | null: false                  |
| building_name      | string    |                              |
| phone_number       | string    | null: false                  |
| order              | reference | null: false,foreign_key:true |


### Association

- has_many :order dependent: :destroy



## ordersテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | -------------------------------|
| user               | reference | null: false, foreign_key: true |
| item               | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :destination



## itemsテーブル

| Column                | Type      | Options                        |
| --------------------- | --------- | ------------------------------ |
| name                  | string    | null: false                    |
| price                 | integer   | null: false                    |
| description           | text      | null: false                    |
| category              | integer   | null: false                    |
| item_condition_id     | integer   | null: false                    |
| shipping_cost_id      | integer   | null: false                    |
| prefecture_id         | integer   | null: false                    |
| shipping_days_id      | integer   | null: false                    |
| user                  | reference | null: false, foreign_key: true |

### Association

- belongs_to :user 
- has_one :order,dependent: :destroy 
