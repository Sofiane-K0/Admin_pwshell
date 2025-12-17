$nb = Read-Host "PLZ enter a number "
do {
    
    try {
        if ($nb -eq 5) {
            Write-Host "ggwp"
        }
        $nb = Read-Host "PLZ enter a number "
        
    }
    catch {
        "An error occurred." 
    }
} while ($nb -ne 5)