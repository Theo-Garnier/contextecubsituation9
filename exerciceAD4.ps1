#=======================================================
#NAME:exerciceAD4.ps1
#AUTHOR: Garnier Th�o
#DATE:26/02/2025
#
#=======================================================

Import-Module ActiveDirectory

$domainDN = "DC=local,DC=dortmund,DC=cub,DC=sioplc,DC=fr"

function Create-ADUser {
    param (
        [string]$FirstName,
        [string]$LastName,
        [string]$OU
    )

    $fullName = "$FirstName $LastName"
    $username = "$($FirstName.ToLower()).$($LastName.ToLower())"
    $ouPath = "OU=$OU,OU=Utilisateurs,$domainDN"

    try {
        New-ADUser -Name $fullName `
                   -GivenName $FirstName `
                   -Surname $LastName `
                   -SamAccountName $username `
                   -UserPrincipalName "$username@local.dortmund.cub.sioplc.fr" `
                   -Path $ouPath `
                   -Enabled $true `
                   -ChangePasswordAtLogon $true `
                   -AccountPassword (ConvertTo-SecureString "ChangeMe123!" -AsPlainText -Force)

        Write-Host "Compte cr�� avec succ�s pour $fullName" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "Erreur lors de la cr�ation du compte pour $fullName : $_" -ForegroundColor Red
        return $false
    }
}



$users = Import-Csv -Path $csvPath -Delimiter ";"
$failedUsers = @()

foreach ($user in $users) {
    $success = Create-ADUser -FirstName $user.firstName -LastName $user.lastName -OU $user.OU
    if (-not $success) {
        $failedUsers += "$($user.firstName) $($user.lastName)"
    }
}

Write-Host "`nR�sum� de la cr�ation des comptes :" -ForegroundColor Cyan
Write-Host "Nombre total de comptes trait�s : $($users.Count)"
Write-Host "Nombre de comptes cr��s avec succ�s : $($users.Count - $failedUsers.Count)"
if ($failedUsers.Count -gt 0) {
    Write-Host "Utilisateurs non cr��s :" -ForegroundColor Yellow
    $failedUsers | ForEach-Object { Write-Host "- $_" -ForegroundColor Yellow }
}