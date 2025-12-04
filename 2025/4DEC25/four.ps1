function PrintGrid {
    param (
        $grid,
        $size
    )
    $k = 0
    for ($i = 0; $i -lt $size; $i++) {
        for ($j = 0; $j -lt $size; $j++) {
            Write-Host $grid[$i,$j]
            $k++
            if ($k % $size -eq 0) {
                Write-Host "`n" # Inserts a new line
            }
        }
    }
    # #foreach ($item in $grid) {
    # for ($g = 0; $g -lt $size; $g++) {
    #     Write-Host $grid[$g]
    #     break
    # #     $k++
    # #     if ($k % $size -eq 0) {
    # #         Write-Host "`n" # Inserts a new line
    # #     }
    # }
}

if ($args.Count -ne 1) {
    Write-Host "Usage: $($MyInvocation.MyCommand.Name) <sample.txt | input.txt> for day4"
    exit
}

# just read in the data as a double array for now...

$inputRow = "..@....@@.@.@@@@.@..@@@.@..@@.@@..@@..@@@@.@..@.@@@@@.@@@@..@@@.@@.@@@.@..@@@@@@.@@.@@@@.@@.@@.@..@.@@@@...@@@@@.@.@.@@@@@@@...@.@@@@@.@@"
$sampleRow = "..@@.@@@@."

#sample.txt 10 x 10
#input.txt 137 x 137

Write-Host "input row $($inputRow.Length) sampleRow $($sampleRow.Length)"

$file = Get-Content -Path $args[0]

$size = $file.Count
Write-Host $($size)
$grid = [string[,]]::new($size, $size)

Write-Host $($file.Count)
for ($i = 0; $i -lt $size; $i++) {
    for ($j = 0; $j -lt $size; $j++) {
        $grid[$i,$j] = $file[$j]
    }
}


#Write-Host $($grid)
PrintGrid -grid $grid -size $size
