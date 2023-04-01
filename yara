rule Creal_Stealer
{
    meta:
        author = "Fevar54"
        description = "Detects Creal Stealer malware and its blacklist checking behavior"
        reference = "https://blog.cyble.com/2023/03/29/creal-new-stealer-targeting-cryptocurrency-users-via-phishing-sites/"
    strings:
        $username_check = "blacklistUsers" ascii wide
        $hostname_check = "blacklistUsername" ascii wide
        $mac_check = "BLACKLIST1" ascii wide
        $ip_check = "sblacklist" ascii wide
    condition:
        all of ($username_check, $hostname_check, $mac_check, $ip_check) and
        any of ($username_check, $hostname_check, $mac_check, $ip_check)
}
