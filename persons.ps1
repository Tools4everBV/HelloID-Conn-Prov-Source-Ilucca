#######################################
# HelloID-Conn-Prov-Source-ilucca-Persons
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
try {
    $usersUri = "$customerUrl/api/v3/users?fields=lastname,firstname,dtcontractstart,dtcontractend,id,manager,extendeddata,displayName,employeeNumber,applicationData,department,userWorkCycles,jobTitle,mail&dtContractEnd=until,2050-10-15,null"
    $headers = @{
        'Authorization' = "Lucca application=$secret"
    } 

    $result = Invoke-RestMethod -Uri $UsersUri -Method GET -Headers $headers 
    $persons = $result.data.items 
    $persons = $persons | Where-Object { ($_.employeeNumber -ne $null) -and ($_.employeeNumber -ne "000") } 
}catch{
    Write-Error "Error querying Ilucca's users";
    Write-Error $_.Exception.Message;
    Exit;
}

foreach ($person in $persons)
{
    $person | Add-Member -Name "ExternalId" -MemberType NoteProperty -Value $person.employeeNumber;
    $managers = $persons | Where-Object {$_.id -eq $person.manager.id};

    $contractObject = @();
    $contracts = [PSCustomObject]@{
        ExternalId = $person.ExternalId;
        ContractEnd = $person.dtContractEnd ;
        ContractStart = $person.dtContractStart;
        ManagerId = $person.manager.Id;
        ManagerEmployeeNumber = $managers.employeeNumber; 
        ServiceId = $person.department.id;
        ServiceName = $person.department.name;
        jobTitle = $Person.jobTitle; 
        ProfileFiggo = $Person.applicationData.profile_figgo.name;
        ProfileCleemy7 = $Person.applicationData.profile_cleemy_7.name;
        ProfileUtime = $Person.applicationData.profile_utime.name;
    }
    $contractObject += $Contracts;
    $person | Add-Member -Name "Contracts" -MemberType NoteProperty -Value $contractObject;
    $person = $person | Select-Object lastName,firstName,dtContractStart,dtContractEnd,manager,id,employeeNumber,department,jobTitle,ExternalId,Contracts,mail,extendeddata,@{Name="DisplayName";Expression={$_.displayName}}  

    Write-Output $person | ConvertTo-json
}

Write-information "Users Imported";
                                                            
