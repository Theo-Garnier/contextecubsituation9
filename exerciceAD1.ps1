#=======================================================
#NAME:exerciceAD1.ps1
#AUTHOR: Garnier Théo
#DATE:26/02/2025
#
#
#=======================================================

do {
try
{
$ouname = Read-host "Quel est le nom de l'unité d'organisation ?"
New-ADOrganizationalUnit -Name $ouname -Path "DC=local,DC=dortmund,DC=cub,DC=sioplc,DC=fr"
}
catch
{
   Write-Host "Attention, l'unité d'organisation $ouname n'a pas pu etre créer !" -ForegroundColor Red
}

$continue = Read-Host "Voulez-vous créer une autre OU ? (O/N)"
} while ($continue -eq "O")




