# 📱アプリ名
## Share Calendar  

# 💡概要
カレンダーを友達や家族や仕事の同僚と共有できるアプリです。  
もちろん、個人でのスケジュール管理としても利用できます。

# ☑️ 本番環境
## https://sharecalendar.herokuapp.com/
## Basic認証
- ユーザー：admin
- パスワード：2222
## テスト用アカウント①
- メールアドレス：aaa@aaa
- パスワード：aaaaaa1
## テスト用アカウント②
- メールアドレス：test@test
- パスワード：aaaaaa1

# 🌟制作背景(意図)
私はプログラミングスクールに入って学習を行っています。
私が所属しているスクールでは、ライフコーチの方に学習の進捗を報告したり、定期的に他の受講生と交流を行っています。  
そこで私がスクールに入って疑問に思ったのが、ライフコーチは一体何人の受講生を一度に管理するのだろうという疑問と、一人一人の受講生のスケジュール管理はどのように行っているのだろうという疑問でした。それがこのアプリを作ったきっかけです。  
どの受講生が何日にどのようなイベントがあるかを一目でわかるようにし、スケジュールの重複や抜けを解決するためにこのアプリを作りました。

# 📝使い方

### トップページ
[![Image from Gyazo](https://i.gyazo.com/6b3b3db608d54428952b1506ae7973ab.png)](https://gyazo.com/6b3b3db608d54428952b1506ae7973ab)
- 1週間の予定を確認できます
- カレンダーを共有ボタンで自分の作成したカレンダーを共有できます
- カレンダーを作成ボタンで新たなカレンダーを作成することができます
- ログアウトボタンでログアウトができます
- カレンダーの名前をクリックすることで該当のカレンダーの詳細画面に遷移します

### カレンダー共有画面
##### ＜ユーザー検索画面＞
[![Image from Gyazo](https://i.gyazo.com/9d7bdb1f6d7aa8d175ba65bc3b150c33.png)](https://gyazo.com/9d7bdb1f6d7aa8d175ba65bc3b150c33)
- 共有したいユーザーのメールアドレスを入力します

[![Image from Gyazo](https://i.gyazo.com/658a9c92b6bb157e5a828b8d55413a3f.png)](https://gyazo.com/658a9c92b6bb157e5a828b8d55413a3f)
 - 共有したいユーザーが見つかると、カレンダーを共有するボタンが出現します

##### ＜共有するカレンダーを選択する画面＞
[![Image from Gyazo](https://i.gyazo.com/fff5976e2d641e39dfec000d270f5efd.png)](https://gyazo.com/fff5976e2d641e39dfec000d270f5efd)
- 自分の作成したカレンダーの一覧が出現するので、該当のカレンダーを押下すると共有が完了します(共有済みのカレンダーはカレンダーの下に記述されています)

### カレンダー作成画面
[![Image from Gyazo](https://i.gyazo.com/e08426b0ce5c8f176cbef9b327f0b180.png)](https://gyazo.com/e08426b0ce5c8f176cbef9b327f0b180)
- 15文字以内でカレンダーを作成することができます

### カレンダー詳細画面
[![Image from Gyazo](https://i.gyazo.com/a40662cdde5f48419d87a7d8a70ea6fc.png)](https://gyazo.com/a40662cdde5f48419d87a7d8a70ea6fc)
- 予定を作成ボタンで予定を作成することができます
- 選択したカレンダーの１ヶ月の予定を確認することができます
- 前の月、次の月のボタンを押下することで、１ヶ月前後の予定を確認することができます
- 作成した予定のタイトルを押下することで、予定の確認画面に遷移します
- カレンダーを削除ボタンを押下するとカレンダーを削除することができます(共有されているカレンダーの場合はカレンダーの共有を解除します)

### 予定作成画面
[![Image from Gyazo](https://i.gyazo.com/d6051f637f583cc6e5726757774a0170.png)](https://gyazo.com/d6051f637f583cc6e5726757774a0170)
- 必須項目を入力することで予定を作成することができます

### 予定確認画面
[![Image from Gyazo](https://i.gyazo.com/2ab14124442977780c93fb66016f7b32.png)](https://gyazo.com/2ab14124442977780c93fb66016f7b32)
- 作成した予定を確認することができます
- 予定を編集ボタンを押下することで、該当の予定の編集を行うことができます
- 予定を削除ボタンを押下することで、予定の削除をすることができます

# ✨工夫したポイント
カレンダー詳細画面でsimple_calendarというgemを使って実装しました。  
また、スケジュールをすぐに確認できるようにリンクを貼り付け使いやすさを意識しました。

# 💬使用した技術(開発環境)
## バックエンド
Ruby, Ruby on Rails
## フロントエンド
HTML, CSS
## データベース
MySQL
## Webサーバ(本番環境)
Heroku
## ソース管理
GitHub, GitHubDesktop
## テスト
Rspec
## エディタ
VSCode

#  🚩課題や今後実装したい機能
- アプリのレスポンシブ化
- ジャンルごとにカレンダー詳細画面の予定の色が変わる機能
- トップページの予定をクリックすると予定確認画面に遷移する

# 📁DB設計
## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| birthday           | date   | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
### Association
- has_many :calenders
- has_many :share_calendars
- has_many :schedules

## calendarsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| calendar_name | string     | null: false                    |
### Association
- has_many :users
- has_many :schedules
- has_many :share_calendars

## schedulesテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| calendar      | references | null: false, foreign_key: true |
| date          | date       | null: false                    |
| schedule_name | string     | null: false                    |
| genre_id      | integer    | null: false                    |
| start_time    | time       |                                |
| end_time      | time       |                                |
| comment       | text       |                                |
### Association
- belongs_to :user
- belongs_to :calendar

## share_calendars
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| calendar | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :calendar
