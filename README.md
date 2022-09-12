## 環境構築

### 使用パッケージとそのバージョン

| パッケージ | バージョン |
| ---------- | ---------- |
| `ruby`     | 2.7.6    |
| `rails`     | 6.0.6   |

### パッケージのインストール

```bash
bundle install --path vendor/bundler
```

### DBの作成

```bash
rails db:create
```

### 動作確認
port: 3001
```bash
rails s
```
http://localhost:3001/
