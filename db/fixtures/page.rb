Page.seed do |p|
  p.raw_title = 'home'
  p.raw_body = <<EOS
Connectのインストール誠にありがとうございます :smile:

# サービス説明

Connectはクローズドな環境で情報・ナレッジを共有するのを目的に作られたサービスです。

会議のアジェンダやアイディアの共有をwikiでまとめ、日報や議論するための考えをブログのエントリーに残してみましょう
:wink:


## 機能について

このバージョンの機能一覧は下記の通りです。

- wiki機能
 - [ページの作成](/pages/new)&編集ができます。
- ブログ機能
 - ユーザー毎にブログエントリーを管理することができます。
 - エントリーに対してコメントすることもできます。
- markdown対応
 - wiki, ブログ機能共にmarkdownで記述することができます。
- 絵文字対応
 - [Emoji cheet sheet](http://www.emoji-cheat-sheet.com/)に載っている絵文字が利用できます :+1:
- 変更履歴機能
 - wiki, ブログ機能のテキストの変更履歴が残ります。
- ロール機能
 - admin権限のみ[管理ページ](/admin/users)にアクセスできます。
- リンク機能
 - トップページに指定したリンクを並べることができます。
- 通知設定
 - HipChatと連携して更新情報をHipChatに送信することができます。
- レスポンシブデザイン
 - スマートフォンやタブレットでも大きくデザインが崩れることはありません。

不具合や機能に関するご要望などありましたら、左下の[問題・要望を投稿する](https://github.com/camelmasa/connect/issues/new)にアクセスし投稿をお願いいたします :bow:
EOS
  p.page_name = 'home'
end
PaperTrail::Version.last.update_column('whodunnit', 1)
