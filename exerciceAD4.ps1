#=======================================================
#NAME:exerciceAD4.ps1
#AUTHOR: Garnier Théo
#DATE:05/03/2025
#
#=======================================================
Import-Module ActiveDirectory


try {
New-ADOrganizationalUnit -Name "service administration réseau" -Path "DC=local,DC=dortmund,DC=cub,DC=sioplc,DC=fr"
New-ADOrganizationalUnit -Name "service commercial" -Path "DC=local,DC=dortmund,DC=cub,DC=sioplc,DC=fr"
New-ADOrganizationalUnit -Name "service comptabilité" -Path "DC=local,DC=dortmund,DC=cub,DC=sioplc,DC=fr"
New-ADOrganizationalUnit -Name "service ressources humaines" -Path "DC=local,DC=dortmund,DC=cub,DC=sioplc,DC=fr"
}
    catch {
        Write-Host "OU deja creer !" -ForegroundColor yellow
    }

$users = Import-Csv -Path "C:\Users\Administrateur.LOCAL\Desktop\Powershell\contextecubsituation9\import.csv" -Delimiter ";"
$domainDN = "DC=local,DC=dortmund,DC=cub,DC=sioplc,DC=fr"


foreach ($user in $users) {
$name = $user.firstName + " " +  $user.lastName
$fname = $user.firstName 
$lname = $user.lastName
$username = $user.firstName + "." +  $user.lastName
$OUPath = $user.OU
$OU = "OU=$OUPath,$domainDN"

 

try {
New-ADUser -Name $name -GivenName $fname -Surname $lname -SamAccountName $username -UserPrincipalName "$username@local.dortmund.cub.sioplc.fr" -Path $OU -Enabled $true -ChangePasswordAtLogon $true -AccountPassword (ConvertTo-SecureString "Etudiant_007" -AsPlainText -Force)
Write-Host "Compte cree avec succes pour $fname" -ForegroundColor Green
    }
    catch {
        Write-Host "Erreur lors de la creation du compte pour $fullName : $_" -ForegroundColor Red
    }
} 