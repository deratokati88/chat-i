# name

chat-i

#　概要

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| image    | string | null: false |

### Association
- has_many :rooms
- has_many :messages
- has_many :charas

## rooms テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| favo     | integer | null: false |
| user_id  | integer | null: false |
| chara_id | integer | nill: false |

### Association
- has_many :chara_message, dependent: :destroy
- has_many :messages, dependent: :destroy

## messages テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| feeling_id | string     | null: false                    |
| content    | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| room       | references | null: false, foreign_key: true |

### Association
- has_many :chara_message, dependent: :destroy
- has_many :messages, dependent: :destroy
  
## charas テーブル

| Column     | Type       | Options                        |
| ---------- | -------    | ------------------------------ |
| name       | string     | null: false                    |
| image      | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :rooms
- has_many :chara_messages
- has_many :message_contents

## chara_messages テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | string     | null: false                    |
| feeling_id   | string     | null: false                    |
| chara        | references | null: false, foreign_key: true |
| room         | references | null: false, foreign_key: true |
| message      | references | null: false, foreign_key: true | 

### Association
- has_one :room
- belongs_to :chara
- has_one :message
- has_one :message_content

## message_contents テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | string     | null: false                    |
| feeling_id   | string     | null: false                    |
| favo         | integer    | null: false                    |
| chara        | references | null: false, foreign_key: true |

### Association
- belongs_to :chara
- has_one :chara_message

