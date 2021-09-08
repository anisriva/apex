# Required files
$rancher_bin = '.\resources\rancher.exe'
$setting_file = '.\resources\setting.ini'

# Rancher credentials (DO NOT SHARE!)
$token = ''
$project = 'development'

# Kubernetes specification
$pod_name = 'oracle-apex-0'
$namespace = 'oracle-apex'
$url = 'https://rancher.corp.dev.blu.digicert.com/'

# Kube Ports
$pod_port_apex = '8080'
$prod_port_db = '1521'
$pod_port_ssh = '22'

# Load custom ports if available in the settings file
$settings_exists = 'Test-Path '+$setting_file+' -PathType Leaf'
if (-Not (Invoke-Expression $settings_exists)){
    Write-Output 'WARNING : .\resources\setting.ini not found using default configuration for ports.'
    $local_port_apex = '8080'
    $local_port_db = '1521'
    $local_port_ssh = '222'
}else{
    Write-Output 'INFO : Found .\resources\setting.ini'
    Get-Content ".\resources\setting.ini" | foreach-object -begin {$all_props=@{}} -process { $k = [regex]::split($_,'='); if(($k[0].CompareTo("") -ne 0) -and ($k[0].StartsWith("[") -ne $True)) { $all_props.Add($k[0], $k[1]) } }
    $local_port_apex = $all_props["apex_port"]
    $local_port_db = $all_props["db_port"]
    $local_port_ssh = $all_props["ssh_port"]    
    $rancher_bin = $all_props["rancher_exe"]
}
$apex_url="http://localhost:"+$local_port_apex+"/ords"

# Check if required files exists
$rancher_exists = 'Test-Path '+$rancher_bin+' -PathType Leaf'
if (-Not (Invoke-Expression $rancher_exists)){
    Write-Output 'Missing required files, contact DE! The program will now terminate.'
    Exit
}
# Create rancher commands
$connect_cmd = $rancher_bin+' login --token '+$token+' --name '+$project+' '+$url+';'
$port_forward = $rancher_bin+' kubectl port-forward '+' pod/'+$pod_name+' '+$local_port_apex+':'+$pod_port_apex+' '+$local_port_db+':'+$prod_port_db+' '+$local_port_ssh+':'+$pod_port_ssh+' -n '+$namespace+';'

Write-Output 'Found all the required files now the program will continue ...
WARNING : Ports '$local_port_apex', '$local_port_db' and '$local_port_ssh' are required to be freed up for the port-forwarding.'
# Connect to kube cluster 
Invoke-Expression $connect_cmd

Write-Output "INFO : Apex link  -> "$apex_url" 
NOTE : Contact DE for credentials!"

# Opening apex URL
Start-Process $apex_url

# Enable port-forwarding
Invoke-Expression $port_forward