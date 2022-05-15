book-manager
============

ISBNを元に蔵書の管理を行うWEBアプリです。

## Usage

### APサーバの準備

1. `ap`ディレクトリに`secret.rb`を作成して、以下の定数を定義します。

|定数|型|内容|
|----|--|----|
|CACHE_DIR|string|書影画像([ISBN].jpg)を保存するディレクトリへの絶対パス|
|RACK_SESSION_SECRET|string|Rackのession secret|
|DB_NAME|string|database名|
|RAKUTEN_APP_ID|integer|楽天APIのApplication ID|
|RAKUTEN_AFFILIATE_ID|string|楽天APIのAffiliate ID|

2. `ap`ディレクトリで以下のコマンドを実行します。

```
> bundle install
> bundle exec pumactl start
```

### WEBサーバの準備

1. Document rootとして`dist`ディレクトリを指定します。
2. Reverse proxy設定等で、`/api`以下へのアクセスを上記APサーバ(`http://localhost:9292`)へ転送するように設定します。