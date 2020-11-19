Function Download-CQAudioFiles {
    param(
        [Parameter(Mandatory = $true)]$Identity,
        [Parameter(Mandatory = $true)]$OutputFolder
    )
    if(($OutputFolder[($OutputFolder.Length -1)]) -like "\"){
        $OutputFolder = $OutputFolder -replace ".$"
    }
    $CQ = Get-CsCallQueue -Identity $Identity
    if ($CQ.WelcomeMusicFileDownloadUri) {
        Invoke-WebRequest -Uri $CQ.WelcomeMusicFileDownloadUri -OutFile ($OutputFolder + "\" + $CQ.Name + " WelcomeMusic.wav") 
    }
    if ($CQ.MusicOnHoldFileDownloadUri) {
        Invoke-WebRequest -Uri $CQ.MusicOnHoldFileDownloadUri -OutFile ($OutputFolder + "\" + $CQ.Name + " MusicOnHold.wav") 
    }
}