# 【PowerShell】Backup
フォルダをバックアップします。(タスクスケジューラ等で管理する想定です。)

## 事前に必要となるもの
・ログを管理するフォルダ。

・設定ファイル。

## 事前設定
・[template](https://github.com/hitorigotsu/Backup/tree/master/template)から「Backup.conf」を入手します。
Sourceにコピー元となるフォルダ、Targetにはコピー先となるフォルダを指定します、

・「Backup.ps1」内の`$Conf`と`$Log_Folder`にフォルダパスを設定します。

`$Conf`には、[template](https://github.com/hitorigotsu/Backup/tree/master/template)で入手した設定ファイルが配置されているフォルダを設定します。

`$Log_Folder`には、`"C:\Users\Test_User\Desktop\Log\"`の部分をログを管理するフォルダ名に変更します。

## 実行結果
スクリプトの実行結果は、ログを管理するフォルダ内に`YYYYMMDD_HHMMSS_Folder_Backup.log`方式で生成されます。
また、エラーで実施できなかった場合は`YYYYMMDD_HHMMSS_Folder_Folder_Backup_Error.log`方式でエラーログが生成されます。
