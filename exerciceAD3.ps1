#=======================================================
#NAME:exerciceAD3.ps1
#AUTHOR: Garnier Théo
#DATE:26/02/2025
#
#=======================================================

do {
$creation = Read-Host "vous voulez choisir une OU ou la Créer ?(O/C)"

If($creation -eq "C"){
try
{
$ouname = Read-host "Quel est le nom de l'unité d'organisation ?"
New-ADOrganizationalUnit -Name $ouname -Path "DC=local,DC=dortmund,DC=cub,DC=sioplc,DC=fr"
}
catch
{
Write-Host "Attention, l'unité d'organisation $ouname n'a pas pu etre créer !" -ForegroundColor Red
}

}
$firstName = Read-Host "Entrer le Prénom"
$lastName = Read-Host "Entrer le Nom"
$username = Read-Host "Entrer le Nom d'utilisateur"
$password = Read-Host "Entrer le Mot de passe" -AsSecureString
$ouPath = Read-Host "Entrer le chemin de l'OU (ex: OU=Users,DC=local,DC=dortmund,DC=cub,DC=sioplc,DC=fr)"

try {
New-ADUser -Name "$firstName $lastName" -GivenName $firstName -Surname $lastName -SamAccountName $username -UserPrincipalName "$username@local.dortmund.cub.sioplc.fr" -AccountPassword $password -Enabled $true -ChangePasswordAtLogon $true -Path $ouPath
Write-Host "L'utilisateur '$username' a été créé avec succès." -ForegroundColor Green
} catch {
Write-Host "Attention, l'utilisateur '$username' n'a pas pu être créé !" -ForegroundColor Red
}

$continueUser = Read-Host "Voulez-vous recommencer ? (O/N)"
} while ($continueUser -eq "O")

