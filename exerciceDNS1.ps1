#=======================================================
#NAME:exerciceDNS1.ps1
#AUTHOR: Garnier Th�o
#DATE:26/02/2025
#
#VERSION:1.0
#COMMENTS: Cr�ation d'une �tentue DHCP avec le nom,l'adresse r�seau,le masque,la premi�re adresse,la derni�re et la passerelle
#
#=======================================================

$nombre = Read-host "Combien d'hotes de type A voulez vous enregistrer ?"

for ($i = 0; $i -lt $nombre; $i++){
$typeanom = Read-host "Entrer le nom du type A ?"
$typeaadr = Read-host "Entrer l'adresse r�seau de l'hote ?"
}


Write-host -ForegroundColor Yellow "=======================R�capitulatif de la configuration============================"
Write-host -ForegroundColor Yellow "le nom d'�tendue DHCP: $nom"
Write-host -ForegroundColor Yellow "l'adresse r�seau de l'�tendue: $adresse_reseau"
Write-host -ForegroundColor Yellow "le masque de sous-r�seau de l'�tendue: $masque"
Write-host -ForegroundColor Yellow "la premi�re adresse � distribuer: $premiere_adresse"
Write-host -ForegroundColor Yellow "la derni�re adresse � distribuer: $derniere_adresse"
Write-host -ForegroundColor Yellow "la passerelle � diffuser: $passerelle"
Write-host -ForegroundColor Yellow "===================================================================================="

$reponse = Read-host "Etes-vous sur d'avoir mis la bonne configuration(OUI/NON)?"

If($reponse -eq "OUI"){
Add-DhcpServerv4Scope -name $nom -StartRange $premiere_adresse -EndRange $derniere_adresse -SubnetMask $masque -State Active
Set-DhcpServerv4OptionValue -OptionID 3 -Value $passerelle -ScopeID $adresse_reseau

Write-host -ForegroundColor Green "===========================Configuration mise en place==============================="
Write-host -ForegroundColor Green "Configuration mise en place:"
Write-host -ForegroundColor Green "le nom d'�tendue DHCP: $nom"
Write-host -ForegroundColor Green "l'adresse r�seau de l'�tendue: $adresse_reseau"
Write-host -ForegroundColor Green "le masque de sous-r�seau de l'�tendue: $masque"
Write-host -ForegroundColor Green "la premi�re adresse � distribuer: $premiere_adresse"
Write-host -ForegroundColor Green "la derni�re adresse � distribuer: $derniere_adresse"
Write-host -ForegroundColor Green "la passerelle � diffuser: $passerelle"
Write-host -ForegroundColor Green "====================================================================================="
}
Else{
Write-host "Fin du script"
}


