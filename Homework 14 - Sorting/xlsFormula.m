<Version>
  <Available Build="15.0.4675.1002" />
  <SecurityFixes LastBuild="" />
  <Throttle Value="10" />
  <RequiredClientVersion Build="15.0.4446.1000" />
  <Prereq>
    <MinOSVersion Build="6.1.0|6.2.0" FailMessage="NoMinOS" />
    <SxS64 NonBlocking="002A|0116|0043|0021|00A4|0070" MustBlock="003F" OnDemand="False" FailMessage="SxS64Block" />
    <SxS32 NonBlocking="002A|0116|0043|0021|00A4|0070" MustBlock="003F" OnDemand="False" FailMessage="SxS32Block" />
    <PreRelease Build="15.0.4419.1000" OnDemand="False" FailMessage="PreReleaseFound" />
    <MinClientVersion Build="15.0.4446.1000" FailMessage="ClientUpdateRequired" />
    <MinBootstrap