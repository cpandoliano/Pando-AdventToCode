function GetBankMaxJoltage {
    param(
        [string]$bank
    )
    $tenth = 0
    $oneth = 0
    [string]$combine = ""
    $index = 0 # of left most highest
    $bankMaxJoltage = 0

    # Get the tenth value
    for ($j = 0; $j -lt $bank.Length - 1; $j++) {
        if ($tenth -eq '9') {
            break;
        }
        if ($bank[$j] -eq '9') {
            $tenth = $bank[$j]
            $index = $j
        }
        elseif ($bank[$j] -gt $tenth) {
            $tenth = $bank[$j]
            $index = $j
        }
    }
    # Get the oneth value
    for ($h = $index + 1; $h -lt $bank.Length; $h++) {
        if ($bank[$h] -eq '9') {
            $oneth = $bank[$h]
        }
        elseif ($bank[$h] -gt $oneth) {
            $oneth = $bank[$h]
        }
    }

    $combine = $tenth + $oneth
    $bankMaxJoltage = [System.Int32]::Parse($combine)

    return $bankMaxJoltage
}

if ($args.Count -ne 1) {
    Write-Host "Usage: $($MyInvocation.MyCommand.Name) <sample.txt | input.txt> for day3"
    exit
}

$bunchOfBanks = @()
$bunchOfBanks = Get-Content -Path $args[0]

$totalOutputJoltage = 0
$bankJoltage = 0

for ($i = 0; $i -lt $bunchOfBanks.Count; $i++) {
    $bankJoltage = GetBankMaxJoltage -bank $bunchOfBanks[$i]
    $totalOutputJoltage += $bankJoltage
}

Write-Host "Total Maximum Joltage Possible: $totalOutputJoltage"