# テーブル設計

## users テーブル

| Column             | Type   | Options             |
| ------------------ | ------ | --------------------|
| nickname           | string | null: false         |
| email              | string | null: false         |
| encrypted_password | string | null: false         |
| family_name        | string | null: false         |
| first_name         | string | null: false         |
| family_name_kana   | string | null: false         |
| first_name_kana    | string | null:false          |
| birth_day          | date   | null: false         |


### Association

- has_many :items dependent: :destroy
- has_one :credit_card dependent: :destroy
- belongs_to :credit_card dependent: :destroy


## destinationテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | -------------------------------|
| family_name        | string    | null: false                    |
| first_name         | string    | null: false                    |
| family_name_kana   | string    | null: false                    |
| first_name_kana    | string    | null: false                    |
| prefecture_id      | integer   | null: false, foreign_key: true |


### Association

- belongs_to :item


## credit_cardsテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | -------------------------------|
| user_id            | reference | null: false, foreign_key: true |
| item_id            | reference | null: false, foreign_key: true |

### Association

- belongs_to :user 
- belongs_to :item 


## itemテーブル

| Column             | Type      | Options                      |
| ------------------ | --------- | -----------------------------|
| name               | string    | null: false                  |
| price              | integer   | null: false                  |
| description        | string    | null: false                  |
| item_condition     | string    | null: false                  |
| shipping_cost      | string    | null: false                  |
| shipping_days      | string    | null: false                  |

### Association

- has_many :images dependent: :destroy
