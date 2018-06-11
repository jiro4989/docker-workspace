# docker-workspace

dockerでよく使うサーバ系アプリコンテナと開発環境を一元管理します。

## 目的

定期ビルドとか開発環境とか予め作っておいて、
実際に業務で使うようになったときにさっとコピペして
作業できるように予習しておこうと思った。

## 構成

- 開発環境コンテナ vimとかgoとかセットアップ済み
- アプリDBコンテナ 開発環境コンテナから参照されるアプリで使うDB
- jenkinsコンテナ リポジトリの監視、定期ビルド、解析結果送信
- sonarqubeコンテナ ソースコード解析結果確認
- redmine タスク管理

## 使い方

### コンテナ起動

リポジトリ直下で下記のコマンドを実行する。

```bash
make build up
```

### ワークスペースにログイン

```bash
make build up login
```

#### MySQLDBにクエリ発行

```bash
# workspaceコンテナ内で
mysql -h $DB_HOSTNAME -u $DB_USERNAME -p$DB_PASSWORD $DB_DATABASE -e 'show tables;'
```

### Jenkins画面確認

- [Jenkinsホーム](http://localhost:8080/)
初回起動時に求められるパスワードは下記のコマンドを実行して取得する。

```bash
cat data/jenkins/secrets/initialAdminPassword | xclip -selection clipboard
```

### MySQLの練習

[問題集](http://tech.pjin.jp/blog/2016/12/05/sql%e7%b7%b4%e7%bf%92%e5%95%8f%e9%a1%8c-%e4%b8%80%e8%a6%a7%e3%81%be%e3%81%a8%e3%82%81/)
を解く。

下記のコマンドでMySQLにアクセスする。

```bash
make build up
sleep 60
make login-db
```

