$result = Invoke-WebRequest "https://maps.googleapis.com/maps/api/geocode/xml?latlng=45.55611,-73.667451"
$message = [xml]$result.Content
$message.GeocodeResponse.result | where {$_.type -eq 'postal_code'}


http://technet.microsoft.com/en-us/magazine/2007.04.powershell.aspx