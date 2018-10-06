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

## Zabbixの画面確認

`docker-compose build && docker-compose up -d`したら下記のコマンドを実行する。

```bash
docker-compose ps
```

結果のうちzabbixのwebコンテナの名前をコピーする。
下記の例だと「docker-workspace_zabbix_web_1」。

```
              Name                            Command               State                  Ports              
--------------------------------------------------------------------------------------------------------------
app_db                             docker-entrypoint.sh mysqld      Up       0.0.0.0:3310->3306/tcp, 33060/tcp
docker-workspace_zabbix_agent_1    docker-entrypoint.sh             Up       10050/tcp                        
docker-workspace_zabbix_db_1       docker-entrypoint.sh mysqld      Up       3306/tcp, 33060/tcp              
docker-workspace_zabbix_server_1   docker-entrypoint.sh             Exit 1                                    
docker-workspace_zabbix_web_1      docker-entrypoint.sh             Up       443/tcp, 0.0.0.0:8080->80/tcp    
jenkins                            /bin/tini -- /usr/local/bi ...   Exit 1                                    
redmine                            /docker-entrypoint.sh rail ...   Up       0.0.0.0:3000->3000/tcp           
redmine_db                         docker-entrypoint.sh mysqld      Up       3306/tcp                         
sonarqube                          ./bin/run.sh                     Up       0.0.0.0:9000->9000/tcp           
sonarqube_datastore                /bin/sh -c /bin/sh               Exit 0                                    
sonarqube_db                       docker-entrypoint.sh postgres    Up       5432/tcp                         
workspace                          /bin/zsh                         Up                                        
```

コンテナ内に入るために先程コピーしたコンテナ名を貼り付ける。

```bash
docker exec -it docker-workspace_zabbix_web_1 bash
```

Zabbixの画面に接続するための画面のIPアドレスを調べるために、下記のコマンドをコン
テナ内で実行する。

```bash
cat /etc/hosts
```

IPを確認したらIPアドレスでZabbixのページにアクセスする。
今回の例ではhttp://172.21.0.10

今回のサンプルでは、ユーザ名とパスワードは下記。

- admin
- zabbix
