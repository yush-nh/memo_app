# メモアプリ
## How to use
1. 任意の作業ディレクトリに移動し、git cloneする
```bash
git clone https://github.com/yourusername/memo-app.git
```
2. `cd memo-app`にてディレクトリを移動
3. `bundle install`を実行
4. `bundle exec rubocop` と `bundle exec erblint --lint-all` を実行して警告が出ないことを確認
5. 初期データファイル、id用ファイルを作成
- コマンドラインで行う場合(Mac, Linux)
```
echo "{}" > db/memos.json
echo "1" > db/next_id.txt
```
- 手動で行う場合
  - app.rbと同じ階層にdbフォルダを作成
  - dbフォルダ内にmemos.jsonファイルを作成し、`{}`を書き込んで保存
  - dbフォルダ内にmemos.jsonファイルを作成し、`1`を書き込んで保存

6. `bundle exec ruby app.rb`でサーバーを立ち上げる
