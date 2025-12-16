# Exercices

## Ex 1.0 Premiers pas
<#
Résoudre les points suivants en une seule commande:
- Lister les commandes liées aux Services et Processus Windows
- Lister les services windows en affichant seulement le nom et le statut sous forme de liste
- Arrêter l’application notepad
- Créer un dossier « Formation » dans c:\
    > New-Item
- Créer un fichier « jour1.ps1 » dans le dossier « Formation »
- Lister uniquement les variables liées au moteur « Powershell »
    > Elles commencent par PS
- Lister en une seule commande les fichiers (pas les dossiers) se trouvant dans les dossiers suivants :
    > C:\Windows\System\, C:\Windows\System32\
#>

# Lister les commandes liées aux Services et Processus Windows
Get-Command 'Service', 'Process'
# Lister les services windows en affichant seulement le nom et le statut sous forme de liste
Get-Service | Select-Object Name, Status
# Arrêter l’application notepad
Stop-Process notepad
# Créer un dossier « Formation » dans c:\
New-Item -Path C:\Formation -ItemType Directory -Force
# Créer un fichier « jour1.ps1 » dans le dossier « Formation »
New-Item -Path C:\Formation\jour1.ps1 -ItemType File -Force
# Lister uniquement les variables liées au moteur « Powershell »
Get-ChildItem variable:\PS*
Get-Variable -Name PS*
# Lister en une seule commande les fichiers (pas les dossiers) se trouvant dans les dossiers
Get-ChildItem -Path 'C:\Windows\System', 'C:\Windows\System32' -File

## Ex 1.1 Les Commandes, le Pipe, Le tri
# Afficher le contenu du dossier c:\Windows

Get-ChildItem C:\Windows

# Trier les fichiers par nom

Get-ChildItem C:\Windows | Sort-Object Name

# Trier les fichiers par nom, par ordre descendant et n’afficher que les 10 premiers

Get-ChildItem C:\Windows | Sort-Object Name -Descending | Select-Object -First 10

## Ex 1.2 Les paramètres de type liste
# Afficher la liste des services Windows sur la machine locale et sur une machine distante dont la description contient les mots "Microsoft" et "Windows"

Get-Service | Where-Object { $_.Description -like '*Microsoft*' -or $_.Description -like '*Windows*' } | Select-Object Name, Description | Measure-Object
# Powershell 5.1
Get-Service -DisplayName '*Microsoft*','*Windows*' <#–ComputerName MonPC#> | Select-Object Name, Description | Measure-Object

## Ex 1.3 Dossier / Fichier et copie recursive

Créer un dossier Images dans C:

# Avec alias
New-Item -Path c:\images -ItemType Directory -Force | Out-Null
# Sans alias
New-Item -Type Directory c:\images | Out-Null

# Copier toutes les images (Png, Gif, Jpg) du dossier « Program Files (x86) » vers le dossier « C:\images »

# Avec alias
dir "C:\Program Files (x86)" -Recurse -Include *.png,*.jpg,*.gif | cp -Destination C:\images
# Sans alias
Get-ChildItem "C:\Program Files (x86)" -Recurse -Include *.png,*.jpg,*.gif | Copy-Item -Destination C:\images

# Vérifier que la solution de l'exercice fonctionne toujours sans alias

Remove-Item Alias:*

## Ex 1.4 : Se familiariser avec les fournisseurs

### Ex 1.4.1 La base de registre

# Créer le chemin dans la base de registre HKCU:\Software\Formation
# Créer la clé de registre username avec comme valeur votre login windows (Variable d'environnement)
# Supprimer le dossier de la base de registre

New-Item -Path HKCU:\Software -Name Formation | New-ItemProperty -Name username -Value $Env:USERNAME
Remove-Item HKCU:\Software\Formation

### Ex 1.4.2 Les fichiers / dossiers

# Créer le dossier `C:\Formation`
# Sauvegarder le résultat de la commande `Get-Process` dans le fichier `C:\Formation\Processus.txt`
# Afficher à l'écran le contenu du fichier
# Supprimer le dossier `C:\Formation`

mkdir C:\Formation | Out-Null
Get-Process > C:\Formation\Processus.txt
Get-Process | Out-File C:\Formation\Processus.txt -Encoding utf8
Remove-Item C:\Formation -Recurse

## Ex 1.5 : Ecrire et paramétrer des scripts
# Ecrire un script permettant d’afficher les services d’un ordinateur
# Le script devra avoir 2 paramètres optionnels
# - ComputerName
# - ServiceName
# La liste des services sera conditionné par la valeur des deux paramètres

param(
    [string[]]$ComputerName = 'localhost',
    [string[]]$ServiceName = '*'
)

Get-Service -ComputerName $ComputerName -Name $ServiceName

# test du script
./getservices.ps1
./getservices.ps1 -ComputerName 'pc1'
./getservices.ps1 -ComputerName 'pc1','pc2'
./getservices.ps1 -ServiceName 'a*'
./getservices.ps1 -ServiceName 'a*','b*'
./getservices.ps1 -ComputerName 'pc1' -ServiceName 'a*'
./getservices.ps1 -ComputerName 'pc1','pc2' -ServiceName 'a*','b*'
