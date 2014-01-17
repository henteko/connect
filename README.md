[![Build Status](https://travis-ci.org/camelmasa/connect.png)](https://travis-ci.org/camelmasa/connect)
[![Coverage Status](https://coveralls.io/repos/camelmasa/connect/badge.png)](https://coveralls.io/r/camelmasa/connect)
[![Code Climate](https://codeclimate.com/repos/52b79e4069568073440066b0/badges/ca296142dd8e53e513b1/gpa.png)](https://codeclimate.com/repos/52b79e4069568073440066b0/feed)
[![Dependency Status](https://gemnasium.com/camelmasa/connect.png)](https://gemnasium.com/camelmasa/connect)

## Connect: クローズドな環境でのナレッジ共有

![Connect](https://dl.dropboxusercontent.com/u/496637/connect.jpg)

wiki + ブログのフロー型とストック型の情報が共有出来るプロダクトです。
[Qiita:Team](http://teams.qiita.com/) が非常に便利だったので自分用に作りました。

## 機能

- wiki機能
- ブログ機能
- markdown対応
- 絵文字対応
- 変更履歴機能
- ロール機能
- リンク機能
- 通知設定
- レスポンシブ

## インストール方法

下記のコマンドでインストールできます。

```
git clone git@github.com:camelmasa/connect.git
cd connect
bundle exec rake db:migrate
bundle exec rake db:seed_fu
bundle exec rails s
```

コマンド実行後、ブラウザからアクセスし下記の入力でログインが可能です。

```
Email: admin@connect.com
Password: admin123
```

heroku, sqaleでの動作も確認済みです。
