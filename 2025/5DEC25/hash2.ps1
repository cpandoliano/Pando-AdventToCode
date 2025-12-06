# Define the large range parameters
$startNumber = 534257831069231
#$startNumber = 0
# Use [int64] to handle numbers larger than Int32 limits if necessary
$endNumber = 534942781913367 
#$endNumber = 15

# Initialize an empty, mutable hashtable.
# Using the [System.Collections.Generic.Dictionary[long, long]] type is highly efficient for large, performance-critical operations.
$hashTable = [System.Collections.Generic.Dictionary[long, long]]::new()

# Use a For loop for better performance with simple ranges
Write-Host "Starting hash population..."
Measure-Command {
    for ($i = $startNumber; $i -le $endNumber; $i++) {
        # Directly add the key-value pair. In this example, the key and value are the same number.
        try {

            $hashTable.Add($i, $i)
        }
        catch {
            continue
        }
    }
} | Select-Object TotalMilliseconds
Write-Host "Finished. Total items: $($hashTable.Count)"
Write-Host "Starting hash population..."
Measure-Command {
    for ($i = $startNumber; $i -le $endNumber; $i++) {
        # Directly add the key-value pair. In this example, the key and value are the same number.
        try {

            $hashTable.Add($i, $i)
        }
        catch {
            continue
        }
    }
} | Select-Object TotalMilliseconds
Write-Host "Finished. Total items: $($hashTable.Count)"

# Example of a lightning-fast lookup in the populated hash table
#$lookupKey = 500000
#Write-Host "Quick lookup for $($lookupKey: $($hashTable[$lookupKey]))"