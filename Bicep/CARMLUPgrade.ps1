Get-ChildItem -Path "<path to carml>\bicep\modules" -Recurse |
ForEach-Object {

    $name = $_.Name;

    if ($_.Name -notin "ps/ms/redis/AAD") {
        if ($name.EndsWith("cies")) {
             $name = $name.Replace("cies", "cy")
        }
        if ($name.EndsWith("ries")) {
             $name = $name.Replace("ries", "ry")
        }
        if ($name.EndsWith("s")) {
             $name = $name.Substring(0, $name.LastIndexOf('s'))
        }  
        if ($name -match "Microsoft.") {
            $name = $name.Replace("Microsoft.", "")
        }
        if ($name -match "deploy.bicep") {
            $name = "main.bicep"
        }

        if (!$name.Contains(".") -and !"PS/MS/AAD/AAAA/CNAME/MX/PTR/SOA/SRV/TXT".Contains($name)) {

            $name = $name.Substring(0, 1).ToLower() + $name.Substring(1)
            $name = $name.Replace("A", "-a")
            $name = $name.Replace("B", "-b")
            $name = $name.Replace("C", "-c")
            $name = $name.Replace("D", "-d")
            $name = $name.Replace("E", "-e")
            $name = $name.Replace("F", "-f")
            $name = $name.Replace("G", "-g")
            $name = $name.Replace("H", "-h")
            $name = $name.Replace("I", "-i")
            $name = $name.Replace("J", "-j")
            $name = $name.Replace("K", "-k")
            $name = $name.Replace("L", "-l")
            $name = $name.Replace("M", "-m")
            $name = $name.Replace("N", "-n")
            $name = $name.Replace("O", "-o")
            $name = $name.Replace("P", "-p")
            $name = $name.Replace("Q", "-q")
            $name = $name.Replace("R", "-r")
            $name = $name.Replace("S", "-s")
            $name = $name.Replace("T", "-t")
            $name = $name.Replace("U", "-u")
            $name = $name.Replace("V", "-v")
            $name = $name.Replace("W", "-w")
            $name = $name.Replace("X", "-x")
            $name = $name.Replace("Y", "-y")
            $name = $name.Replace("Z", "-z")
        }

        Write-Output "old name: $_, new name: $name"

        if ($_.Name -ne $name) { 
            Rename-Item -Path $_.FullName -NewName $name
        }
    }
}
