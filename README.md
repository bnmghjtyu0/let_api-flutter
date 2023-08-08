# flutter 專案

## 開發環境需求

- [VSCode](https://code.visualstudio.com/)
  - P.S. 安裝專案下 .vscode/settings.json 所列的 extension
- [dart >=3.0.2 <4.0.0](https://dart.dev/)
  - flutter pub get

## 目錄架構

```sh
├─README.md
├─analysis_options.yaml                         # flutter lints
├─let_api_flutter.iml
├─pubspec.lock                                  # flutter 設定檔鎖版本
├─pubspec.yaml                                  # flutter 設定檔
├─slidy.yaml                                    # 管理 flutter 常用指令
├─windows
├─web
lib
├─common_libs.dart                              # 共用 export
├─firebase_options.dart                         # firebase 設定檔
├─main.dart                                     # 專案入口
├─router.dart                                   # 路由
├─src
|  ├─widgets                                    # 共用元件
|  ├─ui
|  | ├─screens                                  # 頁面，依據路由名稱定義檔案名稱
|  | ├─common                                   # 頁面共用
|  | |   ├─layout                               # layout
|  | |   |   ├─layout.dart
|  | |   |   └main_layout.dart
|  ├─styles                                     # 樣式
|  ├─core
|  |  ├─utils                                   # 公用小工具
|  |  ├─services                                # API 服務
|  |  ├─riverpods                               # 狀態管理工具
|  |  |     ├─states                            # RiverPod 資料
|  |  |     ├─providers                         # RiverPod 發送
|  |  |     ├─notifiers                         # RiverPod 通知
|  |  ├─models                                  # 型別
|  |  ├─interceptors                            # API 攔截器
|  |  ├─extensions                              # dart extensions
|  |  ├─constants                               # 常數
├─environments                                  # 環境設定 develop, release(sit), prod(uat), master
|      ├─environment.json
|      └environment.prod.json
├─ios                                                       # ios 開發資料夾
├─assets                                                    # 靜態資源
|   ├─image
|   |   └lake.jpg
├─android                                                   # android 開發資料夾
├─.vscode                                                   # 此專案的 vscode 設定
|    ├─extensions.json                                      # 專案所需的 extensions
|    ├─launch.json
|    └settings.json                                         # 專案所需的設定
```

## flutter 指令

- `flutter pub get` 安裝 pubspec.yaml 所有套件

## 啟動專案

1. 安裝專案所需套件(依據 pubspec.yaml)
   ```sh
   flutter pub get
   ```
2. 使用 chrome 開發
   ```sh
   flutter run -d chrome --web-browser-flag "--disable-web-security"
   ```

## 編譯專案

- development 環境
  ```sh
  npm run build:development
  ```
- production 環境
  ```sh
  npm run build
  ```

## 上版階段

| 上版階段 | 分支    | 編譯環境    |
| -------- | ------- | ----------- |
| DEV      | pre-dev | development |
| SIT      | develop | production  |
| UAT      | release | production  |
| PROD     | master  | production  |

P.S. 上版至 SIT 前必須先執行 `版本發布`

## 版本發布

依據語意話版本 https://semver.org/lang/zh-TW/

主版本號

```sh
npm run release:major
```

次版本號

```sh
npm run release:minor
```

修正版本號

```sh
npm run release:patch
```

## Git Message

採用 https://www.conventionalcommits.org/zh-hant/ 規範
主要有以下 type

- chore: 其他瑣事
- core: 核心
- docs: 文件
- feat: 功能/修改
- fix: 修正
- perf: 優化
- refactor: 重構
- revert: 恢復
- style: 排版樣式
- test: 單元測試

## Git Commit 將會觸發以下動作

1. prettier 自動修排版
2. eslint 程式碼檢查
3. commitlint git message 檢查

## 其他 Script

執行方式 `npm run [script-name]`

- `lint` 程式碼檢查
- `lint:only_error` 程式碼檢查只顯示 Error 層級
- `lint:fix` 自動修正(小錯誤)程式碼
- `lint:eslint_current_rule` 顯示當前 eslint 規則
- `lint:eslint_prettier_conflict` 檢查當前 eslint 與 prettier 規則是否有衝突
- `lint:per_rule_performance` 顯示 eslint 規則檢查到錯誤的佔比
- `prettier:check` 顯示需要修正排版的檔案清單
- `prettier:fix` 自動修正排版
- `analyze` 分析編譯後的包大小

## [mock-api] json-server 的啟動流程

1. 啟動 json-server

- 需先安裝 nodemon `npm install -g nodemon`
- 快速執行: `npm run mock`
- 說明: 使用 node server.js 架設 json-server，啟動後的連結為 http://localhost:3000

2. constants/configuration.ts 裡面修改 `location.apiPath` = http://localhost:3000/b2b2c.custPtl

3. 啟動 angular

- 快速執行: `npm run start`
- 說明: 前端串接 mock-api 的環境已經設定在 `environment.jsonserver.ts` 這個檔案，
  經由 angular.json 中的 serve 內建立了 `jsonserver` hook

## 註解

尚未選擇

## 根目錄資料夾說明

- .husky: git 檢測規範
- .vscode: vs code 設定
- projects: 前後台共用元件
- scripts: git 版本號設置
