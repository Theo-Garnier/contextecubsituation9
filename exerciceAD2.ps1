#=======================================================
#NAME:exerciceAD2.ps1
#AUTHOR: Garnier Théo
#DATE:26/02/2025
#
#
#=======================================================

do {
try
{
$firstName = Read-Host "Entrer le Prénom"
$lastName = Read-Host "Entrer le Nom"
$username = Read-Host "Entrer le Nom d'utilisateur"
$password = Read-Host "Entrer le Mot de passe" -AsSecureString


New-ADUser -Name "$firstName $lastName" -GivenName $firstName -Surname $lastName -SamAccountName $username -UserPrincipalName "$username@local.dortmund.cub.sioplc.fr" -AccountPassword $password -Enabled $true -ChangePasswordAtLogon $true


}
catch
{
   Write-Host "Attention, l'utilisateur $username n'a pas pu etre créer !" -ForegroundColor Red
}

$continue = Read-Host "Voulez-vous créer un autre Utilisateur ? (O/N)"
} while ($continue -eq "O")


