#=======================================================
#NAME:exerciceAD1.ps1
#AUTHOR: Garnier Th�o
#DATE:26/02/2025
#
#
#=======================================================

do {
try
{
$ouname = Read-host "Quel est le nom de l'unit� d'organisation ?"
New-ADOrganizationalUnit -Name $ouname -Path "DC=local,DC=dortmund,DC=cub,DC=sioplc,DC=fr"
}
catch
{
   Write-Host "Attention, l'unit� d'organisation $ouname n'a pas pu etre cr�er !" -ForegroundColor Red
}

$continue = Read-Host "Voulez-vous cr�er une autre OU ? (O/N)"
} while ($continue -eq "O")




