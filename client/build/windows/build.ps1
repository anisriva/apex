$src_path="C:\Work\oracle_apex_bins\apex\src\windows\"
$build_path="C:\Work\oracle_apex_bins\apex\build\windows\"
cd $build_path
if ( Invoke-Expression 'Test-Path .\apex-loader -PathType Leaf'){
    Remove-Item .\apex-loader -Recurse
}
if ( Invoke-Expression 'Test-Path apex-loader.zip -PathType Leaf'){
    Remove-Item apex-loader.zip
}

New-Item .\apex-loader -ItemType "directory"
Copy-Item $src_path\resources .\apex-loader\ -Recurse
Copy-Item $src_path\README.txt .\apex-loader\README.txt
Invoke-ps2exe $src_path\apex.ps1 .\apex-loader\apex-loader.exe
Compress-Archive -Path .\apex-loader -DestinationPath apex-loader.zip
Remove-Item .\apex-loader -Recurse