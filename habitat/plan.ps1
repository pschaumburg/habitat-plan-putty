$pkg_name='putty'
$pkg_origin='pschaumburg'
$pkg_maintainer="Patrick Schaumburg <info@p-schaumburg.de>"
$pkg_description="Putty Client"
$pkg_version='0.72'
$pkg_license=('Apache-2.0')

function Invoke-BeforeDefault {
  do_default_before
  update_pkg_version
}

function Invoke-Download {
  New-Item -ItemType Directory -Force -Path ${PLAN_CONTEXT}/../bin/
  $package_source = "https://the.earth.li/~sgtatham/putty/${pkg_version}/w32/putty.exe"
  $Session = New-Object -TypeName Microsoft.PowerShell.Commands.WebRequestSession
  Invoke-WebRequest -Uri $package_source -WebSession $Session -OutFile ${PLAN_CONTEXT}/../bin/${pkg_name}-${pkg_version}.exe
}

function Invoke-Build {
  return 0
}

function Invoke-Install {
  Copy-Item ${PLAN_CONTEXT}/../bin/${pkg_name}-${pkg_version}.exe ${pkg_prefix}/ -Recurse -Force
}

