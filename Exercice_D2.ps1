# Ex 2.4 : Utiliser des boucles et des conditions
# Créer un script qui affiche les services Windows dans la console :

# "Démarré" en couleur verte
# "Arreté" en couleur rouge
# pour les autres status, pas de changement de couleur
# Puis afficher le nombre de service démarrés et arrêtés

# C'est à vous ...

$NbStart = 0
$NbStop = 0
$NbRien = 0


foreach ($service in Get-Service) {
    if ($service.Status -eq "Running") {
        Write-Host $service.Name -ForegroundColor Green
        $NbStart += 1
    }
    elseif ($service.Status -eq "Stopped") {
        Write-Host $service.Name -ForegroundColor Red
        $NbStop += 1
    }
    else {
        Write-Host $service.Name 
        $NbRien += 1
    }
}
Write-Host "Il y à $NbStart service démarré"
Write-Host "Il y à $NbStop service arrêté"
Write-Host "Il y à $NbRien service rien"