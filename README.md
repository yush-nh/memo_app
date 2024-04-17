# メモアプリ
## How to use
1. 任意の作業ディレクトリに移動し、git cloneする
```bash
git clone https://github.com/yourusername/memo-app.git
```
2. `cd memo-app`にてディレクトリを移動
3. `bundle install`を実行
4. `bundle exec rubocop` と `bundle exec erblint --lint-all` を実行して警告が出ないことを確認
5. 初期データファイルを作成
- コマンドラインで行う場合(Mac, Linux)
```
echo "{}" > public/memos.json
```
- 手動で行う場合
publicフォルダ内にmemos.jsonファイルを作成し、`{}`を書き込む

6. `bundle exec ruby app.rb`でサーバーを立ち上げる
