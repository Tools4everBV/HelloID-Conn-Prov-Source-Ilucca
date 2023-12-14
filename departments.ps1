#######################################
# HelloID-Conn-Prov-Source-ilucca-Departments
#
# Version: 1.0.0
#######################################
# Initialize default value's
$config = $Configuration | ConvertFrom-Json
$secret = $config.secret
$customerUrl = $config.customerUrl

# Set debug logging

#region functions

#endregion

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
try{
    $DepartmentsUri =  "$customerUrl/api/v3/departments"
    $headers = @{
            'Authorization' = "Lucca application=$secret"
    }
    $result = Invoke-RestMethod -Uri $DepartmentsUri -Method GET -Headers $headers
    $departments = $result.data.items
}catch{
    throw "Error getting Ilucca departments $($_.Exception.Message)"
}

foreach ($d in $departments){
    $department = [PSCustomObject]@{
        ExternalId  = $d.id
        DisplayName = $d.name
        Name        = $d.name
    }
    Write-Output $department | ConvertTo-Json
}

Write-Information "Departments successfully imported";