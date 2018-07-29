ransack と　datatablesの検証用として使用

Ransack準備
```
gem 'ransack'

```

bundle install


batatables準備
github: https://github.com/rweng/jquery-datatables-rails
を参考にすすめたが、上手く行かなかったので公式ドキュメントからインストールしました

公式ドキュメント参考：https://datatables.net/

ダウンロードから必要なパッケージを選択する方法でインストール

必要なファイルをJS、CSSに入れ込んで、下記コード記載

```
<link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>

<script type="text/javascript" src="DataTables/datatables.min.js"></script>
```
