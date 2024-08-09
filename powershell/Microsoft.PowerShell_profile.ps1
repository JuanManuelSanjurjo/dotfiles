#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/capr4n.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/catppuccin.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/darkblood.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/fish.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/half-life.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jblab_2021.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/json.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/lambdageneration.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/marcduiker.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/mojada.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/quick-term.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/robbyrussell.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/rudolfs-dark.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/stelbent-compact.minimal.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/tiwahu.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/tonybaloney.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/catppuccin_frappe.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/paradox.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/tokyonight_storm.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/agnoster.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/pararussel.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/illusi0n.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/material.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/amro.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/star.omp.json' | Invoke-Expression
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/zash.omp.json' | Invoke-Expression


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function f {
  fzf --reverse --border=rounded --height=95%  --preview 'bat --color=always --style=numbers --line-range :500 {}' --preview-window right:50% $args
}
function batf{
    bat $(f)
}
# Alias para abrir archivos con vim/nvim usando fzf
function vimf {
    vim $(f)
}

function nvimf {
    nvim $(f)
}
function cdf{
  cd (Split-Path -Path (f) -Parent)
}

# help or man function to explain function above
function macros {
    # Crea una lista de objetos personalizados
    $table = @()
    $usuario = $env:USERNAME
    # Agrega filas a la tabla
    Write-Host "Available macros for <$usuario> PowerShell" -ForegroundColor Yellow
    $table += [PSCustomObject]@{ Command = "f"; Description = "- Search file using fzf and bat preview" }
    $table += [PSCustomObject]@{ Command = "cdf"; Description = "- Change directory to the parent of the file using fzf" }
    $table += [PSCustomObject]@{ Command = "batf"; Description = "- Search with fzf nad open file using bat" }
    $table += [PSCustomObject]@{ Command = "nvimf"; Description = "- Search and open file using nvim" }
    $table += [PSCustomObject]@{ Command = "vimf"; Description = "- Search and open file using vim" }

# Muestra la tabla con colores
   Write-Host " " -ForegroundColor Gray
   Write-Host "Command | Description" -ForegroundColor Green
   Write-Host "-----------------------------" -ForegroundColor Gray
   foreach ($row in $table) {
        # Escribe el comando en color cian
        Write-Host -NoNewline (" " + $row.Command + "`t ") -ForegroundColor Cyan
        
        # Escribe la descripción en color amarillo
        Write-Host ( $row.Description) -ForegroundColor Yellow
        
        # Separador
        Write-Host " " -ForegroundColor Gray
    }
}

$env:BAT_THEME= "OneHalfDark"

Invoke-Expression (& { (zoxide init powershell | Out-String) })
