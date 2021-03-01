# V-Media

## サイト概要
ラジオ番組や、ネットラジオ配信サービスなど、音声メディアに関するレビュー投稿サイト。

### サイトテーマ
音声メディアについて、ユーザーの声を届けるサイト。

### テーマを選んだ理由
新型コロナウイルス感染症の流行によって、ラジオを聴く人が増えたそうです。
私自身もラジオに寄り添ってもらい、救われました。
各々が自粛生活、自宅で過ごすときの選択肢として音声メディアが更に広まればよいと思いました。
音声メディアについて発信できる場を通じて、人と人の繋がりを感じられたらと想い、作成に至りました。

### ターゲットユーザ
年齢：老若男女
音声メディアに興味があるが、何を聴いていいのかわからない人
自分に合う番組や、コンテンツを探している人
自分の好きな番組や、声について発信したい人

### 主な利用シーン
音声コンテンツに関する情報を閲覧し、聴くかどうか参考にする。
番組を聴きながら感想を共有し、同じものを好きな人と繋がる。

## 設計書
#### チャレンジ機能一覧
https://docs.google.com/spreadsheets/d/19tBtU9sSe4LNPW0ren62vqk6bZfZsx6H3pZXQAFwCnY/edit?usp=sharing

#### 画面遷移図
https://drive.google.com/file/d/1a7nOft6M4jTPyeKSwR4-Rc56qaSINVRy/view?usp=sharing

#### ER図
https://drive.google.com/file/d/14u3f999nqAblzIyWVMGS_jIX37VVGltW/view?usp=sharing

#### テーブル定義書
https://docs.google.com/spreadsheets/d/1nbk-xkwsO6d4YonrDZSTQ_l6vr9_-p1NAMJTcRf4Oxw/edit?usp=sharing

#### アプリケーション詳細設計書
https://drive.google.com/file/d/1t9idcZaezGXdqipoYpGIv6LSbZm8zJ2j/view?usp=sharing

## アプリケーションの機能一覧
##### ・ユーザー認証機能
##### ・レビュー投稿機能
##### ・レビューにコメント、いいねをつける機能
##### ・ページネーション機能
##### ・検索機能
##### ・お問い合わせ機能
##### ・メーラー機能(お問い合わせ内容を指定のアドレスに転送)
##### ・管理者機能

## アプリケーションで使用している技術一覧
##### ・デプロイ環境構築 AWS
##### ・WEBサーバー Nginx
##### ・アプリケーションサーバー puma
##### ・データベース MySQL
##### ・ユーザー認証機能ライブラリ devise
##### ・画像アップロードライブラリ refile

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
#### サイトイメージロゴ　DesignEvo　
https://www.designevo.com/jp/

#### アイコン　FontAwesome
https://fontawesome.com/kits/e51724a875/use?welcome=yes
