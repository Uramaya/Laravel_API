# CYO道より飲み会アプリ

> 飲食店で飲み会をしたいあなたへ、このアプリがあなたの側にある素敵な店を地図でおすすめします。
> 今夜も一人、友達、同僚と飲み会に行くあなたへ、楽しい食事を！

## 事前条件
　・Dockerがインストールされてる事

## 【バックエンド】
　・データベースCRUDのAPIを主に

## コンテナ
　・Laravel
　・Nginx
　・MySQL

## 初期設定
* 開発プロジェクトをgit cloneする
``` bash
　git clone ssh://git@gitlab.avelio.jp:60122/CYOFindFoodApp/laravel_api.git 
```

* Dockerマシンを起動
　
```bash
　docker-machine start
```
　
　
* Dockerマシンを起動とIP確認
　
```bash
　docker-machine ls
```
　
> -　Dockerのマシン-defaultが起動しているか確認する。＊マークがある場合は正常起動。
> -　DockerのマシンのIP（URL）に記載されてるIPを確認。例：192.168.99.105


* Dockerコンテナをビルド、立ち上げる
``` bash
　docker-compose build && docker-compose up -d 
```

* Dockerコンテナが正常に起動したか確認
``` bash
　docker-compose ps 
```
（例）
```
     Name                    Command               State                    Ports
---------------------------------------------------------------------------------------------------
laravel_db_1      docker-entrypoint.sh mysql ...   Up      0.0.0.0:3306->3306/tcp, 33060/tcp
laravel_nginx_1   /bin/sh -c /usr/sbin/nginx ...   Up      0.0.0.0:443->443/tcp, 0.0.0.0:80->80/tcp
laravel_php_1     docker-php-entrypoint php-fpm    Up      9000/tcp

```

* Laravel envファイル設定

``` bash
cp .env.example .env
```

* Composer install

``` bash
composer install
```

* Laravel KEYを生成

``` bash
php artisan key:generate
```

* Webページを開く

・http
``` 
http://｛DcokerのIP｝:80
```

・https
``` 
https://｛DcokerのIP｝:443
```

* Laravelのページもしくは開発ページが表示されたら、成功です！


## PHPコーディング規約（PSR12）
※コーディング規約のルールはphpcs.xmlを参照ください

* phpcs 規約チェック
``` bash
composer sniffer
```

* phpcbf 自動整形
``` bash
composer sniffer-rewrite
```

* phpcs 規約チェック結果出力
※出力場所：/sniffer-reports/report.csv 
``` bash
composer sniffer-report-csv
```

## デバッグ（Xdebugの使用）
> productionではXdebugを無効にすること
> VSCode使用
1. laravel_api/laravel_project/ または　laravel_api/ をルートとしてフォルダを開く
2. Debug Pointの設定
3. Debugメニュー > RUN
4. ページにアクセス
* breakpointを設定していないのにも拘わらず、invalid payload exceptionで実行が止まるときは  
VSCodeのデバッグメニューの左下"BREAKPOINTS"のEverythingのチェックを外す