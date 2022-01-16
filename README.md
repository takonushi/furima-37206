# テーブル設計

## users テーブル
| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |
| last_name            | string | null: false               |
| first_name_reading   | string | null: false               |
| last_name_reading    | string | null: false               |
| birth_date           | date   | null: false               |

### Association
 - has_many :items
 - has_many :orders

## items テーブル ※商品画像はActiveStorageによる実装,カテゴリー(category)/商品の状態(condition)/配送料の負担(charge)/発送元の地域(area)/発送までの日数(number_of_days)はActiveHashによる実装
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| explanation          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| charge_id            | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| number_of_days_id    | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - has_one :order

## orders テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :item
 - has_one :sending

 ## sendings テーブル ※都道府県(perfecture)はActiveHashによる実装
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postal_code          | string     | null: false                    |
| prefecture_id        | integer    | null: false                    |
| city                 | string     | null: false                    |
| house_number         | string     | null: false                    |
| building_name        | string     |                                |
| telephone_number     | string     | null: false                    |
| order                | references | null: false, foreign_key: true |

### Association
 - belongs_to :order
