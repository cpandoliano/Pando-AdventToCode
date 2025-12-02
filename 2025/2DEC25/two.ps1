if ($args.Count -ne 1) {
    Write-Host "Usage: $($MyInvocation.MyCommand.Name) <sample.txt> for day2"
    exit
}

$elfId = @()
$lineCount = 0

$startRange = 0
$endRange = 0

$invalidIdTotal = 0

# split the comma separated values
Get-Content -Path $args[0] | ForEach-Object {
    $idNum = $_.Split(',') 
    if ($idNum.Contains("\n")) {
        continue
    }
    $elfId += $idNum
}

# foreach ($id in $elfId) {
#     Write-Host $id 
# }

# get the lineCount of the Array
$lineCount = $elfId.Count


# loop the range
for ($i = 0; $i -lt 1; $i++) {
    # set the startRange and endRange
    $startRange, $endRange = $elfId[$i].Split("-")

    # skip the empty lines
    if ($endRange -eq $null) {
        continue
    }

    # function: $invalidId = findInvalidId -start $startRange -end $endRange
    # $invalidIdTotal += $invalidId

    for ($i = $startRange; i -le $endRange; $i++) {
        
    }
    
    # Write-Host $startRange
    # Write-Host $endRange
}

Write-Host "Invalid ID totals: $invalidIdTotal"

# find repeat

