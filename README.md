# nutmeg-cloud

NUTMEG クラウドに関するリポジトリ

## 背景

## 構成

## 今後の展望

---

## 開発手順

### 1. クローン

```bash
git clone git@github.com:NUTFes/nutmeg-cloud.git
```

### 2. 開発

- kubernetes -> ?
- keycloak -> ?
- minio -> ?

### 4. add, commit, push

- コミットはコミットメッセージの書式にしたがってください。
- プッシュは今いるブランチと同じ名前の場所にプッシュしてください。

```bash
# add
git add <file_name or directory_name>

# commit
git commit -m "<commit message>"

# push
git push origin <branch名>
```

#### commit メッセージの書式

- ファイルを追加したとき
  `git commit -m "[add] 内容 (#<issue番号>)"`
- ファイルを変更したとき
  `git commit -m "[mod] 内容 (#<issue番号>)"`
- ファイルを削除したとき
  `git commit -m "[del] 内容 (#<issue番号>)"`
- 例
  `git commit -m "[mod] 学籍番号の送信書式をJSONに変更 (#12)"`

### 5. Pull Request

- 確認してほしい点を明記してプルリクを書いてください

