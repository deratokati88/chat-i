# name

chat-i

# 概要
ユーザーが作成したキャラとのチャットが楽しめます。ユーザーはキャラのメッセージについて好感度やメッセージの感情を設定でき、条件に該当した時のみメッセージを返信するように設定できます。
チャットのやりとりをすることにより好感度が上昇していくので、会話のバリエーションが増えることがあります。
他のユーザーが作成したキャラとも会話することが可能なので、完成度の高いキャラを作ることのもゲームの楽しみ方の一つです。

# URL
https://chat-i32475.herokuapp.com/

# テスト用アカウント
* メールアドレス：hogehoge@hoge.com
* パスワード：hugahuga

# 利用方法
まずはユーザー登録を行い、サインインしましょう。その後自分でキャラを作成するか、すでに作成してあるキャラとのチャットルームを作成しメッセージを送信しましょう。メッセージを送るごとに好感度が上がっていくので、帰ってくる返信メッセージも増えてくるはずです。

# 目指した課題解決
疑似恋愛を体験できるゲームを目指しました。キャラを作成するといった、クリエイター的な楽しみ方と作成したキャラを他のユーザーに遊んでもらうとというのもゲームの楽しみ方の一つです。

# 洗い出した機能

|実装したい機能|要件|
|:---|:---|
|ユーザー管理機能|・ユーザーを新しく登録できる|
||・ユーザー登録されていれば、ログインできる|
||・サインアウトできる|
|ルーム作成機能|・キャラとチャットするルームを作成することができる|
||・ルームの名前はユーザーが決定することができる|
||・チャットを行うキャラを作成されたキャラから選択できる|
|メッセージ作成機能|・メッセージを送信することができる|
||・投稿したメッセージは投稿したチャットルームにのみ表示できる|
|メッセージ返信機能|・メッセージが送信されたあと自動で返信用のメッセージを作成できる|
||・返信用メッセージは投稿したチャットルームにのみ表示できる|
||・返信用メッセージはルームが作成された際に選択されたキャラに結びついた物からランダムで選択される|
||・返信用メッセージは好感度に応じたものが選択される|
||・返信用メッセージは送信されたメッセージの気持ちに応じて選択される|
|キャラ作成機能|・チャットするキャラをユーザーが作成できる|
||・キャラの返信用メッセージについてもユーザーが作成できる|
||・キャラの返信用メッセージは作成した後も編集削除ができる|


# 実装した機能について
- 画像と名前を入力しキャラを作成することができる。
![キャラ作成](https://gyazo.com/6045307abbe9352166f7da3540a1df37.gif)

- キャラメッセージをユーザーが作成することができる
![キャラメッセージ作成](https://gyazo.com/645ffa273c976cad053b8746fa5f75e9.gif)

- メッセージを送信すると対応したキャラメッセージの中からランダムで選択され、返信される
![キャラメッセージ作成](https://gyazo.com/3efc4b3e80a1a78fc9be92e2792cd575.gif)

# 実装したかった機能
- キャラの好感度上がりやすさを左右する性格設定
- キャラの検索機能
- キャラの評価機能

# ER図
![chat-i](https://user-images.githubusercontent.com/74710163/103333740-3e9c5900-4ab2-11eb-8ad5-c122611bee15.png)


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

