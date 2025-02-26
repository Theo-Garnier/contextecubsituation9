#=======================================================
#NAME:exerciceDNS1.ps1
#AUTHOR: Garnier Théo
#DATE:26/02/2025
#
#
#=======================================================

$nombre = Read-host "Combien d'hotes de type A voulez vous enregistrer ?"

for ($i = 0; $i -lt $nombre; $i++){

try
{
$typeanom = Read-host "Entrer le nom du type A ?"
$typeaadr = Read-host "Entrer l'adresse réseau de l'hote ?"
Add-DnsServerResourceRecord -A -Name $typeanom -ZoneName "local.dortmund.cub.sioplc.fr" -IPv4Address $typeaadr
}
catch
{
   Write-Host "Attention, l'enregistrement numéro $i n'a pas pu etre possible !" -ForegroundColor Red
}
Write-Host "le nom du type A entrer est $typeanom avec pour adresse ip $typeaadr" -ForegroundColor yellow
}





