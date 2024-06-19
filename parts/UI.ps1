# Imports
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

[void] [System.Windows.Forms.Application]::EnableVisualStyles() 

[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')       | out-null
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework')      | out-null
[System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')             | out-null
[System.Reflection.Assembly]::LoadWithPartialName('WindowsFormsIntegration')    | out-null


$script:icon        = New-Object system.drawing.icon $ScriptPath\assets\soft-drink-mini.ico
$script:icondark    = New-Object system.drawing.icon $ScriptPath\assets\soft-drink-mini-dark.ico





# ----------------------------------------------------
# Part - Add the systray menu
# ----------------------------------------------------        


# Display an icon in tray
$Main_Tool_Icon = New-Object System.Windows.Forms.NotifyIcon
$Main_Tool_Icon.Text = $text.TopUI.Appname
$Main_Tool_Icon.Icon = $icon
$Main_Tool_Icon.Visible = $true
$Main_Tool_Icon.Add_Click({                    
    If ($_.Button -eq [Windows.Forms.MouseButtons]::Left) {
        $Main_Tool_Icon.GetType().GetMethod("ShowContextMenu",[System.Reflection.BindingFlags]::Instance -bor [System.Reflection.BindingFlags]::NonPublic).Invoke($Main_Tool_Icon,$null)
    }
})



# About in notification bubble
$Menu_About                             = New-Object System.Windows.Forms.MenuItem
$Menu_About.Text                        = $text.TopUI.About
$Menu_About.add_Click({
    Start-Process "https://github.com/teamcons/Assistant"
 })



# ----------------------------------------------------
# Part - OCR TO CLIPBOARD
# ----------------------------------------------------        



 # About in notification bubble
#$Menu_OCR                               = New-Object System.Windows.Forms.MenuItem
#$Menu_OCR.Text                          = $text.OCR.Menu
#$Menu_OCR.add_Click({OCR_ToClipboard})




# ----------------------------------------------------
# Part - CLIPBOARD
# ----------------------------------------------------        


## Hot corners 
$script:Submenu_clipboard                   = New-Object System.Windows.Forms.MenuItem
$Submenu_clipboard.Text                     = $text.Clipboard.Menu

$clear                                      = New-Object System.Windows.Forms.MenuItem
$clear.Text                                 = $text.Clipboard.Clear
$clear.Add_Click({Clear-ClipboardHistory})

Clipboard_generate_entries $Submenu_clipboard

$Submenu_clipboard.Add_Popup({Clipboard_generate_entries $Submenu_clipboard})












# ----------------------------------------------------
# Part - HOTCORNER TOPLEFT
# ----------------------------------------------------        

# Toggle between halt and continue
$Menu_Toggle_HotCorner_TopLeft                  = New-Object System.Windows.Forms.MenuItem
$Menu_Toggle_HotCorner_TopLeft.Checked          = $true
$Menu_Toggle_HotCorner_TopLeft.Text             = $text.Hotcorners.Overview
$Menu_Toggle_HotCorner_TopLeft.Add_Click({
    # If it was checked when clicked, stop it
    # Else, it wasnt checked, so start it
    if ($Menu_Toggle_HotCorner_TopLeft.Checked) {
        #Stop-Process -Id $hotcorner_topleft_ID
        Stop-Process -Name hotcorner_topleft
        $Menu_Toggle_HotCorner_TopLeft.Checked = $false}
    else {
        Start-Process $ScriptPath\parts\hotcorner_topleft.exe
        $Menu_Toggle_HotCorner_TopLeft.Checked = $true
    
        $hotcorner_topleft_ID}
 })



# ----------------------------------------------------
# Part - HOTCORNER-META
# ----------------------------------------------------        


# Toggle between halt and continue
$Menu_Toggle_HotCorner_WinButton = New-Object System.Windows.Forms.MenuItem
$Menu_Toggle_HotCorner_WinButton.Checked = $false
$Menu_Toggle_HotCorner_WinButton.Text = $text.Hotcorners.WinButton
$Menu_Toggle_HotCorner_WinButton.Add_Click({
    # If it was checked when clicked, stop it
    # Else, it wasnt checked, so start it
    if ($Menu_Toggle_HotCorner_WinButton.Checked) {
        Stop-Process -Name hotcorner_winbutton
        $Menu_Toggle_HotCorner_WinButton.Checked = $false}
    else {
        Start-Process $ScriptPath\parts\hotcorner_winbutton.exe
        $Menu_Toggle_HotCorner_WinButton.Checked = $true}
 })


# ----------------------------------------------------
# Part - HOTCORNER-META
# ----------------------------------------------------        


# Toggle between halt and continue
$Menu_Toggle_HotCorner_ShowDesktop = New-Object System.Windows.Forms.MenuItem
$Menu_Toggle_HotCorner_ShowDesktop.Checked = $false
$Menu_Toggle_HotCorner_ShowDesktop.Text = $text.Hotcorners.ShowDesktop
$Menu_Toggle_HotCorner_ShowDesktop.Add_Click({
    # If it was checked when clicked, stop it
    # Else, it wasnt checked, so start it
    if ($Menu_Toggle_HotCorner_ShowDesktop.Checked) {
        Stop-Process -Name hotcorner_bottomright_showdesktop
        $Menu_Toggle_HotCorner_ShowDesktop.Checked = $false}
    else {
        Start-Process $ScriptPath\parts\hotcorner_bottomright_showdesktop.exe
        $Menu_Toggle_HotCorner_ShowDesktop.Checked = $true}
 })



 
# ----------------------------------------------------
# Part - HOTCORNER MENU
# ----------------------------------------------------        

# Toggle between halt and continue
$Menu_Toggle_HotCorner_Close = New-Object System.Windows.Forms.MenuItem
$Menu_Toggle_HotCorner_Close.Checked = $false
$Menu_Toggle_HotCorner_Close.Text = $text.Hotcorners.Close
$Menu_Toggle_HotCorner_Close.Add_Click({
    # If it was checked when clicked, stop it
    # Else, it wasnt checked, so start it
    if ($Menu_Toggle_HotCorner_Close.Checked) {
        Stop-Process -Name hotcorner_topright_close
        $Menu_Toggle_HotCorner_Close.Checked = $false}
    else {
        Start-Process $ScriptPath\parts\hotcorner_topright_close.exe
        $Menu_Toggle_HotCorner_Close.Checked = $true}
 })



# ----------------------------------------------------
# Part - HOTCORNER MENU
# ----------------------------------------------------        

## Hot corners 
$script:Submenu_hotcorner                  = New-Object System.Windows.Forms.MenuItem
$Submenu_hotcorner.Text             = $text.Hotcorners.Menu
$Submenu_hotcorner.MenuItems.Add($Menu_Toggle_HotCorner_TopLeft)
$Submenu_hotcorner.MenuItems.Add($Menu_Toggle_HotCorner_WinButton)
$Submenu_hotcorner.MenuItems.Add($Menu_Toggle_HotCorner_ShowDesktop)
$Submenu_hotcorner.MenuItems.Add($Menu_Toggle_HotCorner_Close)





# ----------------------------------------------------
# Part - KEEPAWAKE
# ----------------------------------------------------        


# Toggle between halt and continue
$Menu_Toggle_KeepAwake = New-Object System.Windows.Forms.MenuItem
$Menu_Toggle_KeepAwake.Checked = $true
$Menu_Toggle_KeepAwake.Text = $text.TopUI.KeepAwake
$Menu_Toggle_KeepAwake.Add_Click({
    # If it was checked when clicked, stop it
    # Else, it wasnt checked, so start it
    if ($Menu_Toggle_KeepAwake.Checked) {
        #Stop-Process -Id $keepawakeID
        Stop-Process -Name keepawake
        $Menu_Toggle_KeepAwake.Checked = $false
        $Main_Tool_Icon.Icon = $icondark }
    else {
        Start-Process $ScriptPath\functionalities\keepawake.exe
        $Menu_Toggle_KeepAwake.Checked = $true
        $Main_Tool_Icon.Icon = $icon }
 })



# ----------------------------------------------------
# Part - AUTOSTART
# ----------------------------------------------------        

$autostart = -join($env:APPDATA,"\Microsoft\Windows\Start Menu\Programs\Startup")
$WshShell = New-Object -ComObject WScript.Shell


# Toggle between halt and continue
$Menu_Toggle_Autostart = New-Object System.Windows.Forms.MenuItem
$Menu_Toggle_Autostart.Text = $text.TopUI.Autostart
$Menu_Toggle_Autostart.Checked = (Test-Path $autostart\Assistant.lnk)
$Menu_Toggle_Autostart.Add_Click({
    # If it was checked when clicked, delete autostart shortcut
    # Else, it wasnt checked, so create autostart shortcut
    if ($Menu_Toggle_Autostart.Checked) {
        Remove-Item $autostart\Assistant.lnk
        $Menu_Toggle_Autostart.Checked = $false}
    else {
        $Shortcut = $WshShell.CreateShortcut( -join($autostart,"\Assistant.lnk"))
        $Shortcut.IconLocation = (-join($ScriptPath,"\assets\soft-drink.ico"))
        $Shortcut.TargetPath = (-join($ScriptPath,"\Assistant.exe"))
        $Shortcut.Save()
        $Menu_Toggle_Autostart.Checked = $true }
 })


 # ----------------------------------------------------
# Part - STOP
# ----------------------------------------------------        


# Stop everything
$Menu_Exit = New-Object System.Windows.Forms.MenuItem
$Menu_Exit.Text = $text.TopUI.Exit
$Menu_Exit.add_Click($quit)




# ---------------------------------------------------------------------
# All
$Main_Tool_Icon.ContextMenu = New-Object System.Windows.Forms.ContextMenu
$Main_Tool_Icon.contextMenu.MenuItems.Add($Menu_About)

$Main_Tool_Icon.ContextMenu.MenuItems.Add("-");

#$Main_Tool_Icon.contextMenu.MenuItems.Add($Menu_OCR)

$Main_Tool_Icon.contextMenu.MenuItems.Add($Submenu_clipboard)
$Main_Tool_Icon.contextMenu.MenuItems.Add($Submenu_hotcorner)


$Main_Tool_Icon.ContextMenu.MenuItems.Add("-");
$Main_Tool_Icon.contextMenu.MenuItems.Add($Menu_Toggle_KeepAwake)
$Main_Tool_Icon.contextMenu.MenuItems.Add($Menu_Toggle_Autostart)
$Main_Tool_Icon.contextMenu.MenuItems.Add($Menu_Exit)


# ---------------------------------------------------------------------
