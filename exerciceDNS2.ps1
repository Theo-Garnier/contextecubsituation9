#=======================================================
#NAME:exerciceDNS2.ps1
#AUTHOR: Garnier Théo
#DATE:26/02/2025
#
#
#=======================================================
$reponse = Read-host "Choisir un enregistrement A ou CNAME ?(A saisir A)(CNAME saisir C)"

$nombre = Read-host "Combien enregistrement voulez vous faire ?"


If($reponse -eq "A"){

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
}
else{

for ($i = 0; $i -lt $nombre; $i++){

try
{
$typecnamenom = Read-host "Entrer le nom du type CNAME ?"
$typecnamehost = Read-host "Entrer le FQDN de l'hote visé ?"
Add-DnsServerResourceRecord -CName -Name $typecnamenom -HostNameAlias $typecnamehost -ZoneName "local.dortmund.cub.sioplc.fr" -AllowUpdateAny
}
catch
{
   Write-Host "Attention, l'enregistrement numéro $i n'a pas pu etre possible !" -ForegroundColor Red
}
Write-Host "le nom du type CNAME entrer est $typecnamenom avec pour FQDN $typecnamehost" -ForegroundColor yellow
}

}

