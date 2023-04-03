$ErrorActionPreference = "Stop"

#設定ファイル定義
$Conf = "C:\Backup.conf"
#ログフォルダ定義
$Log_Folder = "C:\Users\Test_User\Desktop\Log\"
#日付定義
$Date = Get-Date -Format "yyyyMMdd"
#ログ/エラーログファイル名定義
$Log_Name = $Date + "_Folder_Backup.log"
$Error_Log_Name = $Date + "_Folder_Backup_Error.log"

#ログのファイルパス作成
$Log_File = Join-Path $Log_Folder $Log_Name
$Error_Log_File = Join-Path $Log_Folder $Error_Log_Name


#メイン処理
try{
       
    #Confの行数確認
    $wc = (Get-Content $Conf -Encoding "UTF8")| Measure-Object
    

    if($wc.count -eq 2){

        $Conf_Read = Get-Content $Conf -Encoding "UTF8" | Select-String -NotMatch "#"
        $Conf_Read =  $Conf_Read -replace "`n",""
        $Copy_Items = $Conf_Read.split(",")

    }Elseif($wc.count -ne 2){
    
        "設定ファイルが2行ではありません。" > $Error_Log_File    

    }

    
    if((Test-Path $Copy_Items[0]) -and (Test-Path $Copy_Items[1])){

        Copy-Item $Copy_Items[0] $Copy_Items[1] -Recurse -Force
        "以下引数でバックアップを行っております。`n"  + $Copy_Items | Out-File $Log_File

    }
}

Catch{
    
    $Error[0]  > $Error_Log_File
}
