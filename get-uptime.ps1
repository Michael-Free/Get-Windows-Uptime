function Get-Uptime {
    # Get the last boot time
    $lastBoot = Get-CimInstance -ClassName Win32_OperatingSystem | 
                Select-Object -ExpandProperty LastBootUpTime

    # Calculate uptime
    $uptime = (Get-Date) - $lastBoot

    $output = [PSCustomObject]@{
        'Last Boot Time' = $lastBoot
        'Uptime Days'    = $uptime.Days
        'Uptime Hours'   = $uptime.Hours
        'Uptime Minutes' = $uptime.Minutes
        'Uptime Seconds' = $uptime.Seconds
    }

    return $output
}
