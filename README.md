# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| image    | string | null: false |
## rooms テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| favo     | integer | null: false |
| user_id  | integer | null: false |
| chara_id | integer | nill: false |

## messages テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| feeling_id | string     | null: false                    |
| content    | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| room       | references | null: false, foreign_key: true |

## charas テーブル

| Column | Type    | Options     |
| ------ | ------- | ----------- |
| name   | string  | null: false |
| image  | text    | null: false |

## chara_messages テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| j_message_id | integer    | null: false                    |
| f_message_id | integer    | null: false                    |
| s_message_id | integer    | null: false                    |
| h_message_id | integer    | null: false                    |