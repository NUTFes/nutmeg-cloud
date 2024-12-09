# Proxmoxディレクトリ

## 概要

Proxmoxの設定をterraformで管理している

## お願い
- Makefileを仕様してコマンドを叩いてね
- applyの前にplanの結果を教えてね

## 環境構築
### macの場合
```bash
brew install tfenv
tfenv install 1.10.0
tfenv use 1.10.0
```

### windows(WSL)の場合
[このサイト](https://zenn.dev/shz/articles/0c237d00267be4)のコピペなので失敗したらごめんなさい

```bash
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
tfenv install 1.10.0
tfenv use 1.10.0
```

### 確認
```bash
terraform -v
```

以下のようにでるはず
```bash
Terraform v1.10.0
on darwin_arm64

Your version of Terraform is out of date! The latest version
is 1.10.1. You can update by downloading from https://www.terraform.io/downloads.html
```


## 作成したいとき
1. リポジトリを作成する

下のコマンドを実行する
```bash
make init DIR_NAME=example
```
exampleにはプロダクト名や用途など、わかるように設定

2. 変数ファイルを編集
`/envs/example/terraform.tfvars` を修正する
「x」になってるところを変えて欲しい
コメントを読みながら作成してください
スペックに関する部分(cpu,cores,memory,swap,disksize)は相談しながら決めましょう

3. planを実行
下のコマンドを実行する
```bash
make plan DIR_NAME=example
```
planはドライランなので、本当に実行した際に起きる差分を出してくれます
この結果をPRに貼り付けてインフラの誰かに見てもらってください

4. アクセスする

作成したリソースに対してSSHする

`注意！`
```
nutmeg cloudへの場合、PVEを踏み台サーバにしてSSHする必要がある
インフラの誰かに聞いてね
```
叩くコマンド
```
ssh nutmeg@<変数ファイルに書いたIP>
```
作成したリソースに対してAnsibleを実行し、必要なモジュールを揃えよう










