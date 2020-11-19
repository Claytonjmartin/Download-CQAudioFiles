Function Download-CQAudioFiles {
    <#
    Description:
        This function will download previously uploaded audio files from the specified Microsoft Teams call queue to the specified folder on the local machine.
    Parameters:
        -Identitiy
        -OutputFolder
    Example:
        Download-CQAudioFiles -Identitiy "6f45e634-0e8d-4f00-8f32-d8d4ca18dcfa" -OutputFolder "C:\Users\adm\Downloads\queue1"
    Author:
        Clayton Martin
    Source: 
        https://github.com/Claytonjmartin/Download-CQAudioFiles
    Disclamer: 
        This script is provided "As Is" without any warranty of any kind. In no event shall the author be liable for any damages arising from the use of this script.
    #>
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