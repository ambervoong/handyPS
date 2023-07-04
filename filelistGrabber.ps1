# Use param -Path to specify the path to grab
param ($Path = "C:\")

$pcname = hostname

# Script to get the file name, length, and timestamp of all files in a folder
gci $Path -Force -Recurse | ForEach-Object {
                                                if ($_.GetType().Name -eq "FileInfo") {
                                                    $_ | Select Name, Length, LastWriteTimeUtc | Export-Csv -NoTypeInformation -Path "($pcname)-fileList.csv"                                   
                                                    }
                                            }