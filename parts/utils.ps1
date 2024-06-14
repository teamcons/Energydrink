
# Imports
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing


#================================
# Project icon in Base 64
# [Convert]::ToBase64String((Get-Content "..\assets\Skrivanek-Rocketlaunch-Icon.ico" -Encoding Byte))
Write-Output "[STARTUP] Loading icon"

[string]$iconBase64 = 'AAABAAEAICAAAAEAIACoEAAAFgAAACgAAAAgAAAAQAAAAAEAIAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgDP/CnQ58L90OfD/dDnw/3Q58P90OfD/dDnw/3Q58P91OfDAdC7/CwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAdDjw/XQ58P90OfD/dzzx/49X9/+ha/v/qHL9/6hy/f+ha/v/kFj3/3c98f90OfD/dDnw/3Q48P0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHM48P+rdv7/rXj//614//+teP//rXj//614//+teP//rXj//614//+teP//rXj//614//+teP//q3b+/3M48P8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACpc/2JrXj//614//+teP//rXj//614//+teP//rXj//614//+teP//rXj//614//+teP//rXj//614//+teP//rXj//6l1/4kAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAK14//+teP//rXj//614//+teP//rXj//614//+teP//rXj//614//+teP//rXj//614//+teP//rXj//614//+teP//rXj//wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAerL7/2XJ+f9pxfr/kJj9/613//+teP//rXj//614//+teP//rXj//614//+teP//rXj//614//+teP//rXj//614//+teP//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABb1vn/W9b5/1vW+f9b1vn/W9b5/1vW+f+td///rXj//614//+teP//rXj//614//+teP//rXj//614//+teP//rXj//614//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFvW+f9b1vn/W9b5/1vW+f9b1vn/W9b5/1vW+f+off7/rXj//614//+teP//rXj//614//+teP//rXj//614//+teP//rXj//wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAW9b5/1vW+f9b1vn/W9b5/1vW+f9b1vn/W9b5/1vW+f+teP//rXj//614//+teP//rXj//614//+teP//rXj//614//+teP//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACx7P/+W9b5/56J/v+teP//rXj//614//+teP//ip/8/1rW+f+teP//rXj//614//+teP//rXj//614//+teP//rXj//614//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALHs//+5jv//rXj//614//+teP//rXj//614//+teP//rXj//5qN/f+teP//rXj//614//+teP//rXj//614//+teP//rXj//wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAuY7//7mO//+5jv//rXf//q14//+teP//rXj//614//+teP//k5X9/1vW+f+ci/7/rXj//614//+teP//rXj//613//9f0Pn/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC5jv//uY7//7mO//+5jv//uY3/+q14//+teP//rXj//614//+teP//W9b5/1vW+f9b1vn/W9b5/1vW+f9b1vn/W9b5/1vW+f8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALmO//+5jv//uY7//7mO//+5jv//uY7//7iM//mteP//rXj//614//+teP//W9b5/1vW+f9b1vn/W9b5/1vW+f9b1vn/W9b5/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAuY7//7mO//+5jv//uY7//7mO//+5jv//uY7//7mO//+4jP/5rXj//614//+teP//Wtb5/1vW+f9b1vn/W9b5/1vW+f9b1vn/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC5jv//uY7//7mO//+5jv//uY7//7mO//+5jv//uY7//7mO//+5jv//rXj//614//+teP//qXv+/1vW+f9b1vn/W9b5/1vW+f8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALmO//+5jv//uY7//7mO//+5jv//uY7//7mO//+5jv//uY7//7mO//+5jv//rXj//614//+teP//rXj//614//+mf/7/dLj6/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAuY7//7mO//+5jv//uY7//7mO//+5jv//uY7//7mO//+5jv//uY7//7mO//+5jv//rXj//614//+teP//rXj//614//+teP//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC5jv//uY7//7mO//+5jv//uY7//sKc//PKrP/1y6///suu///Lrv//zK7//cqr//TAmf/srXj//a14//+teP//rXj//614//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALmO//+6j//8y67//8uu///Lrv//y67//8uu///Lrv//y67//8uu///Lrv//y67//8uu//+5jv//uY7//7mO//+teP/8rXj//wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAyKn/98uu///Lrv//y67//8uu///Lrv//y67//8uu///Lrv//y67//8uu///Lrv//y67//8mq//i5jv//uY7//7mO//+3i//2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADLrv//y67//8uu///Lrv//y67//8uu///Lrv//y67//8uu///Lrv//y67//8uu///Lrv//y67//7mO//+5jv//uY7//7mO//8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMuu///Lrv//y67//8uu///Hp//3r3v/+K14//+teP//rXj//614//+teP//rXj//697//jGp//3uY7//bmO//+5jv//uY7//wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAzbH/JMuu//+uev/6rXj//614//3YtLHx7tOH/O3Sh//t0of/7dKH/+3Sh//u0of817Kx8614//2ncv/1k2D/+rmO//+8jf8mAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAArXj//N69pPTt0of/7dKG//bnvf/579D/+e/Q//nv0P/579D/+e/Q//nv0P/2577/7dKG/+3Sh//Xt6T0kl7//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADpzY757dKH//nv0P/579D/+e/Q//nv0P9oIBb/aCAW/2ggFv9nHxX/+e/Q//nv0P/579D/+e/Q/+3Sh//ny475AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO3Sh//s0IX/0XMi/92aV//579H/+e/Q//HWrP/RcyL/0XMi//jtzf/579D/+e/R/92bWf/RcyL/7NCF/+3Sh/8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO3Sh//s0Yb/0XIh/9FzIv/BWxb/0XMi/9FzIv/RcyL/0HEh/8tpHf/RcyL/0XIh/+zRhv/t0of/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP//gALt0ofn7dKH/+fBW//RcyL/58Fb/+fBW//RcyL/58Fb/+3Sh//t0ojp//+AAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANFyIf///////////9FzIf8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANVqFQzbbSQHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA///////gB///gAH//wAA//4AAH/+AAB//gAAf/4AAH/+AAB//gAAf/4AAH/+AAB//gAAf/4AAH/+AAB//gAAf/4AAH/+AAB//gAAf/4AAH/+AAB//gAAf/4AAH/+AAB//gAAf/8AAP//AAD//wAA//+AAf//wAP///w////+f/8='
[string]$icondark64 = 'AAABAAEAICAAAAEAIACoEAAAFgAAACgAAAAgAAAAQAAAAAEAIAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAZjOZCjwdeL86HXj/Oh14/zodeP86HXj/Oh14/zodeP89HXrAdBeLCwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOhx6/TodeP86HXj/PB54/0gsfP9QNn7/VDl+/1Q5fv9QNn7/SCx8/zwfeP86HXj/Oh14/zocev0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADoceP9WO3//VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/Vjt//zoceP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABXPYCJVjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1c9gIkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFY8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPVl+/zNkfP81Yn3/SEx+/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAua3z/Lmt8/y5rfP8ua3z/Lmt8/y5rfP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC5rfP8ua3z/Lmt8/y5rfP8ua3z/Lmt8/y5rfP9UP3//VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALmt8/y5rfP8ua3z/Lmt8/y5rfP8ua3z/Lmt8/y5rfP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABYdoH+Lmt8/09Ef/9WPID/VjyA/1Y8gP9WPID/RVB+/y1rfP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFh2gP9cR4D/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/01Gfv9WPID/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/VjyA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAXEeA/1xHgP9cR4D/VjyB/lY8gP9WPID/VjyA/1Y8gP9WPID/Skp+/y5rfP9ORn//VjyA/1Y8gP9WPID/VjyA/1Y8gP8waHz/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABcR4D/XEeA/1xHgP9cR4D/XkaC+lY8gP9WPID/VjyA/1Y8gP9WPID/Lmt8/y5rfP8ua3z/Lmt8/y5rfP8ua3z/Lmt8/y5rfP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFxHgP9cR4D/XEeA/1xHgP9cR4D/XEeA/1xIgPlWPID/VjyA/1Y8gP9WPID/Lmt8/y5rfP8ua3z/Lmt8/y5rfP8ua3z/Lmt8/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAXEeA/1xHgP9cR4D/XEeA/1xHgP9cR4D/XEeA/1xHgP9cSID5VjyA/1Y8gP9WPID/LWt8/y5rfP8ua3z/Lmt8/y5rfP8ua3z/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABcR4D/XEeA/1xHgP9cR4D/XEeA/1xHgP9cR4D/XEeA/1xHgP9cR4D/VjyA/1Y8gP9WPID/VD5//y5rfP8ua3z/Lmt8/y5rfP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFxHgP9cR4D/XEeA/1xHgP9cR4D/XEeA/1xHgP9cR4D/XEeA/1xHgP9cR4D/VjyA/1Y8gP9WPID/VjyA/1Y8gP9TQH//Olx9/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAXEeA/1xHgP9cR4D/XEeA/1xHgP9cR4D/XEeA/1xHgP9cR4D/XEeA/1xHgP9cR4D/VjyA/1Y8gP9WPID/VjyA/1Y8gP9WPID/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABcR4D/XEeA/1xHgP9cR4D/XEeB/mNQgPNmVoD1ZliB/mZXgP9mV4D/aFmA/WVYgfRgToHsWDyA/VY8gP9WPID/VjyA/1Y8gP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFxHgP9dSoH8ZleA/2ZXgP9mV4D/ZleA/2ZXgP9mV4D/ZleA/2ZXgP9mV4D/ZleA/2ZXgP9cR4D/XEeA/1xHgP9WPoH8VjyA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAZFaA92ZXgP9mV4D/ZleA/2ZXgP9mV4D/ZleA/2ZXgP9mV4D/ZleA/2ZXgP9mV4D/ZleA/2ZVgfhcR4D/XEeA/1xHgP9cRoH2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABmV4D/ZleA/2ZXgP9mV4D/ZleA/2ZXgP9mV4D/ZleA/2ZXgP9mV4D/ZleA/2ZXgP9mV4D/ZleA/1xHgP9cR4D/XEeA/1xHgP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGZXgP9mV4D/ZleA/2ZXgP9kVoD3WECB+FY8gP9WPID/VjyA/1Y8gP9WPID/VjyA/1hAgfhjVoD3XkmA/VxHgP9cR4D/XEeA/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAalyOJGZXgP9ZPYL6VjyA/1g8gP1uXFrxd2pG/HZpRP92aUT/dmlE/3ZpRP93aUb8bFlY81g8gP1UOYD1SjKC+lxHgP9rV4YmAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAVj6B/HFeVPR2aUT/dmlD/3t0Xv98eGj/fHho/3x4aP98eGj/fHho/3x4aP97dF//dmlD/3ZpRP9uXVT0SzGB/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB2Zkn5dmlE/3x4aP98eGj/fHho/3x4aP80EAv/NBAL/zQQC/80EAv/fHho/3x4aP98eGj/fHho/3ZpRP92Zkn5AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHZpRP92aEL/aDoR/25NLP98eGj/fHho/3hrVv9oOhH/aDoR/3x2Zv98eGj/fHho/25OLf9oOhH/dmhC/3ZpRP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHZpRP92aEP/aDkR/2g6Ef9gLgv/aDoR/2g6Ef9oOhH/aDkR/2Y1D/9oOhH/aDkR/3ZoQ/92aUT/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///wJ2a0TndmlE/3RgLv9oOhH/dGAu/3RgLv9oOhH/dGAu/3ZpRP92aUbp////AgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGg5Ef+AgID/gICA/2g6Ef8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJVVFQy2bSQHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA///////gB///gAH//wAA//4AAH/+AAB//gAAf/4AAH/+AAB//gAAf/4AAH/+AAB//gAAf/4AAH/+AAB//gAAf/4AAH/+AAB//gAAf/4AAH/+AAB//gAAf/4AAH/+AAB//gAAf/8AAP//AAD//wAA//+AAf//wAP///w////+f/8='

# phew
# Rebuild an image from base 64
$iconBytes = [Convert]::FromBase64String($iconBase64)
$stream = [System.IO.MemoryStream]::new($iconBytes, 0, $iconBytes.Length)
$icon = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::new($stream).GetHIcon()))

$iconBytes = [Convert]::FromBase64String($icondark64)
$streamdark = [System.IO.MemoryStream]::new($iconBytes, 0, $iconBytes.Length)
$icondark = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::new($streamdark).GetHIcon()))




# Stop EVERYTHING
$quit = {
    $Main_Tool_Icon.Visible = $false

    # Stop everything that needs stopping
    if ($Menu_Toggle_HotCorner_TopLeft.Checked)     {Stop-Process -Name hotcorner_topleft}
    if ($Menu_Toggle_HotCorner_WinButton.Checked)   {Stop-Process -Name hotcorner_winbutton}
    if ($Menu_Toggle_KeepAwake.Checked)             {Stop-Process -Name keepawake}

    $Main_Tool_Icon.Icon.Dispose();
    $Main_Tool_Icon.Dispose();
    $appContext.Dispose();
 }


 


# This is very ugly
#https://www.itcodar.com/csharp/sending-windows-key-using-sendkeys.html
$source = @"
using System;
using System.Threading.Tasks;
using System.Runtime.InteropServices;
using System.Windows.Forms;
namespace KeySends
{
    public class KeySend
    {
        [DllImport("user32.dll")]
        public static extern void keybd_event(byte bVk, byte bScan, int dwFlags, int dwExtraInfo);
        private const int KEYEVENTF_EXTENDEDKEY = 1;
        private const int KEYEVENTF_KEYUP = 2;
        public static void KeyDown(Keys vKey)
        {
            keybd_event((byte)vKey, 0, KEYEVENTF_EXTENDEDKEY, 0);
        }
        public static void KeyUp(Keys vKey)
        {
            keybd_event((byte)vKey, 0, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0);
        }
    }
}
"@
Add-Type -TypeDefinition $source -ReferencedAssemblies "System.Windows.Forms"












<#
Get-ClipboardHistory: Get the texts contained in the clipboard history.
Clear-ClipboardHistory: Clearing the clipboard history

In PowerShell 7.1 or later, use the following command to install Microsoft.Windows.SDK.NET.Ref with administrative privileges.
Find-Package -ProviderName NuGet -Source https://www.nuget.org/api/v2 -Name Microsoft.Windows.SDK.NET.Ref | Install-Package
#>

$needsSDK = $PSVersionTable.PSVersion -ge "7.1.0" 

if ($needsSDK)
{
    $sdkLib = Split-Path -Path (
        Get-Package -ProviderName NuGet -Name Microsoft.Windows.SDK.NET.Ref |
            Select-Object -ExpandProperty Source) -Parent |
        Join-Path -ChildPath "\lib"
    Add-Type -Path "$sdkLib\Microsoft.Windows.SDK.NET.dll"
    Add-Type -Path "$sdkLib\WinRT.Runtime.dll"
}
else
{
    Add-Type -AssemblyName System.Runtime.WindowsRuntime
}

$clipboard = if ($needsSDK)
{
    [Windows.ApplicationModel.DataTransfer.Clipboard]
}
else
{
    [Windows.ApplicationModel.DataTransfer.Clipboard, Windows.ApplicationModel.DataTransfer, ContentType = WindowsRuntime]
}

function await
{
    param($AsyncTask, [Type]$ResultType)

    $method = [WindowsRuntimeSystemExtensions].GetMember("GetAwaiter") |
        where {$_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1'} |
        select -First 1
    $method.MakeGenericMethod($ResultType).
    Invoke($null, @($AsyncTask)).
    GetResult()
}

function Get-ClipboardHistory
{
    $type = if ($script:needsSDK)
    {
        [Windows.ApplicationModel.DataTransfer.ClipboardHistoryItemsResult]
    }
    else
    {
        [Windows.ApplicationModel.DataTransfer.ClipboardHistoryItemsResult, Windows.ApplicationModel.DataTransfer, ContentType = WindowsRuntime]
    }

    $result = await $script:clipboard::GetHistoryItemsAsync() $type
    
    $outItems = if ($script:needsSDK)
    {
        @($result.Items.AdditionalTypeData.Values)
    }
    else
    {
        @($result.Items)
    }

    $outItems |
        where {$_.Content.Contains("Text")} |
        foreach {await $_.Content.GetTextAsync() ([string])}
}

function Clear-ClipboardHistory
{
    $script:clipboard::ClearHistory() | Out-Null
}












Function Clipboard_generate_entries {
    param ($menu)

    # Prepare
    $menu.MenuItems.Clear()
    $script:clipboard_history = Get-ClipboardHistory

    # Build new entries
    $entry0 = New-Object System.Windows.Forms.MenuItem
    $entry0.Text = ($clipboard_history[0])[0..20] -join ""
    $entry0.Add_Click({Set-Clipboard $clipboard_history[0]})
    $menu.MenuItems.Add($entry0)

    $entry1 = New-Object System.Windows.Forms.MenuItem
    $entry1.Text = ($clipboard_history[1])[0..20] -join ""
    $entry1.Add_Click({Set-Clipboard $clipboard_history[1]})
    $menu.MenuItems.Add($entry1)

    $entry2 = New-Object System.Windows.Forms.MenuItem
    $entry2.Text = ($clipboard_history[2])[0..20] -join ""
    $entry2.Add_Click({Set-Clipboard $clipboard_history[2]})
    $menu.MenuItems.Add($entry2)

    $entry3 = New-Object System.Windows.Forms.MenuItem
    $entry3.Text = ($clipboard_history[3])[0..20] -join ""
    $entry3.Add_Click({Set-Clipboard $clipboard_history[3]})
    $menu.MenuItems.Add($entry3)

    $entry4 = New-Object System.Windows.Forms.MenuItem
    $entry4.Text = ($clipboard_history[4])[0..20] -join ""
    $entry4.Add_Click({Set-Clipboard $clipboard_history[4]})
    $menu.MenuItems.Add($entry4)


}