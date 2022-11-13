# テーブル設計

## users テーブル

| Column             | Type   | Options             |
| ------------------ | ------ | --------------------|
| nickname           | string | null: false         |
| email              | string | null: false         |
| encrypted_password | string | null: false         |
| user_image         | string |                     |
| family_name        | string | null: false         |
| first_name         | string | null: false         |
| family_name_kana   | string | null: false         |
| first_name_kana    | string | null:false          |
| birth_day          | date   | null: false         |
| introduction       | text   |                     |

### Association

- has_many :items dependent: :destroy
- has_one :credit_credit_card dependent: :destroy
- belongs_to :card dependent: :destroy


## destinationテーブル

| Column             | Type      | Options                      |
| ------------------ | --------- | -----------------------------|
| family_name        | string    | null: false                  |
| first_name         | string    | null: false                  |
| family_name_kana   | string    | null: false                  |
| first_name_kana    | string    | null: false                  |
| post_code          | string    | null: false                  |
| prefecture         | string    | null: false                  |
| city               | string    | null: false                  |
| address            | string    | null: false                  |
| building_name      | string    |                              |
| phone_number       | string    |                              |
| user_id            | integer   | null: false,foreign_key:true |


### Association

- belongs_to :user


## credit_cardsテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | -------------------------------|
| user_id            | integer	 | null: false, foreign_key: true |
| prototype          | string    | null: false                    |
| user               | string    | null: false                    |

### Association

- belongs_to :user 


## categoryテーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ------------|
| name               | string 	 | null: false |
| ancestry           | string    |             |

### Association

- has_many :item


## itemテーブル

| Column             | Type      | Options                      |
| ------------------ | --------- | -----------------------------|
| name               | string    | null: false                  |
| price              | string    | null: false                  |
| size               | string    | null: false                  |
| description        | string    | null: false                  |
| item_condition     | string    | null: false                  |
| shipping_cost      | string    | null: false                  |
| shipping_days      | string    | null: false                  |
| prefecture_id      | integer   | null: false,foreign_key:true |
| category_id        | integer   | null: false,foreign_key:true |
| brand_id           | integer   | null: false,foreign_key:true |
| shipping_id        | integer   | null: false,foreign_key:true |
| user_id            | integer   | null: false,foreign_key:true |

### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :images dependent: :destroy



## imageテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- |--------------------------------|
| image              | string 	 | null: false                    |
| item_id            | integer   | null: false,foreign_key:true   |

### Association

- belongs_to :item


## brandテーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ------------|
| name               | string 	 | index: true |

### Association

- has_many :item