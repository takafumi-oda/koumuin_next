# 公務員NEXT


## 1. サービス概要
**転職を考える公務員のための交流サイトです。**

![top-page](https://user-images.githubusercontent.com/79225764/141842717-b5854be9-895c-4c6c-8ec4-04a1e623479b.jpeg)

  ~~**URL** ▶︎ https://www.koumuin-next.com~~

  **紹介記事** ▶︎ https://qiita.com/subun33/items/886331cd679ef65051e8
  <p style="text-indent:1em;">アプリの概要に加えて、開発にあたっての気づきなどもまとめています。<p>

<br>

-   PCからでも、スマホからでもご利用いただけます。
-   「トップページ」の**ゲストユーザーでログインする**ボタンを押していただいたら、ユーザー登録をせずに利用できます。
-   **管理者機能をご利用になる場合**は、以下のメールアドレス、パスワードでご利用いただけます。
    <br>
    メールアドレス：admin@email.co.jp
    <br>
    パスワード：adminpass
-   各相談ページの閲覧のみであれば、ログインをせずに利用できます。

<br>

**開発の経緯**

自分自身が転職を意識し始めた際に、「公務員から民間企業に転職できるのだろうか」、「家族からは反対されないだろうか」などといった不安が頭によぎり、随分と調べました。

その中で、公務員から民間への転職を考えている人は一定数いること、**同じような不安を持っている人がいる**ことを知りました。

結局、転職できるか、できないかは、本人が行動するかどうかですが、**周囲に相談しにくいこの問題について、同じ境遇の人と交流ができれば、最初の一歩を踏み出すきっかけにはなる**と考え、このサービスを開発しました。

<br>

## 2. 使用技術

### フロントエンド

-   HTML
-   CSS
-   Bootstrap 5.0.0
-   React(React on Rails 12.3.0)

### バックエンド

-   Ruby 2.7.3
-   Ruby on Rails 6.1.4
-   MySQL 8.0.26

### インフラ

-   Docker 20.10.7 / docker-compose 1.29.2 （開発環境）
-   AWS ( VPC, EC2, RDS, Route53, ACM )
-   Nginx 1.20.1
-   Unicorn 6.0.0
-   CircleCI 2.1

### その他

-   Git 2.24.3 / GitHub
-   VSCode

<br>

## 3. インフラ構成図
![infra](https://user-images.githubusercontent.com/79225764/141701796-1904a4ab-285d-4b93-801f-33cd2d06ebc0.png)

<br>

## 4. ER図
![er](https://user-images.githubusercontent.com/79225764/143621234-f2d4a27b-c877-491c-8bea-992eaf29612d.png)

<br>

## 5. サービスの機能一覧

-   **ユーザー登録・編集・退会、ログイン・ログアウト**
-   **ゲストログイン**
-   **管理者権限**（ユーザー一覧、強制退会、各ユーザーへのメモ、相談・回答の削除）
-   **相談の登録・削除**
-   **相談への回答・回答への返信及び削除**
-   **相談一覧**（Ajaxによるページネーション）
-   **キーワード検索**
-   **いいね**（React）
-   **お気に入り**（React）

<br>

## ６. 開発にあたって意識した点

-   **フロントエンド**

      - 一覧のページ送りや投稿ユーザー情報の表示は、ページ遷移による**ユーザーのストレスをなくすため**に、Ajax（非同期通信）で実装しました。
<br><br>
      - 入力フォームや投稿一覧など、繰り返し使用するviewについては、**修正時の修正漏れを防ぐなど、保守性を考慮して**、partialに切り出しました。

<br>

-   **バックエンド**

      - 管理者権限を持ったユーザーのみ利用できる管理者画面では、登録ユーザーの確認、強制退会、各登録ユーザーへの管理者用のメモ（例：強制退会させた場合にその旨をメモ）を実装しました。また、反社会的な投稿などがあった場合、管理者ユーザーであれば、各相談ページから削除できるようにするなど、**実際の運用を想定した機能を実装**しました。
<br><br>
      - RspecによるテストやRubocopによるコードチェックを導入していましたが、**デプロイ前の確認忘れを防ぐため、また毎回のデプロイの手間を省力化するため**、CircleCIによる、CI/CDを導入しました。
<br><br>
      - Rspecによる統合テストでは、**不適当な入力を防止するため**に、正常に動作することのテストだけでなく、不適応な入力があった場合には、エラーとなることもテストを書くようにしていました。
