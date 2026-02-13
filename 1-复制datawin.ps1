$ErrorActionPreference = "Stop"

# ---------- 工具函数 ----------
function Copy-IfExists {
    param (
        [string]$Source,
        [string]$Dest,
        [string]$InfoMsg
    )

    if (Test-Path $Source) {
        $destDir = Split-Path $Dest
        if (-not (Test-Path $destDir)) {
            New-Item -ItemType Directory -Path $destDir | Out-Null
        }

        Copy-Item $Source $Dest -Force
        Write-Host "[I] $InfoMsg"
    }
    else {
        Write-Host "[W] $Source not found."
    }
}

# ---------- Steam 安装目录 ----------
$DeltaruneDir = "C:\Program Files (x86)\Steam\steamapps\common\Deltarune"

# Windows（已安装版本）
1..4 | ForEach-Object {
    $src  = Join-Path $DeltaruneDir "chapter$_`_windows\data.win"
    $dest = "workspace\ch$_\data.win"
    Copy-IfExists $src $dest "Copied Deltarune Chapter $_"
}

Copy-IfExists `
    (Join-Path $DeltaruneDir "data.win") `
    "workspace\main\data.win" `
    "Copied Deltarune Launcher"


# ---------- Steam Depot · Windows ----------
$DeltaruneDirWinDepot = "C:\Program Files (x86)\Steam\steamapps\content\app_1671210\depot_1671212"

1..4 | ForEach-Object {
    $src  = Join-Path $DeltaruneDirWinDepot "chapter$_`_windows\data.win"
    $dest = "data_win\ch$_\data.win"
    Copy-IfExists $src $dest "Copied Deltarune Chapter $_ Win"
}

Copy-IfExists `
    (Join-Path $DeltaruneDirWinDepot "data.win") `
    "data_win\main\data.win" `
    "Copied Deltarune Launcher Win"


# ---------- Steam Depot · macOS ----------
$DeltaruneDirMac = "C:\Program Files (x86)\Steam\steamapps\content\app_1671210\depot_1671213\DELTARUNE.app\Contents\Resources"

1..4 | ForEach-Object {
    $src  = Join-Path $DeltaruneDirMac "chapter$_`_mac\game.ios"
    $dest = "data_win\ch$_\game.ios"
    Copy-IfExists $src $dest "Copied Deltarune Chapter $_ Mac"
}

Copy-IfExists `
    (Join-Path $DeltaruneDirMac "game.ios") `
    "data_win\main\game.ios" `
    "Copied Deltarune Launcher Mac"
