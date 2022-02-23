Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set WSHShell=WScript.CreateObject("WScript.Shell")
Set WMI = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Do
Running = False
Set colItems = objWMIService.ExecQuery("Select * from Win32_Process")
For Each objItem in colItems
	If objItem.Name = "1548052.bat" Then  'Измените 1548052 на название Вашего bat файла
		Running = True
		Exit For
	End If
Next
If Not Running Then
	CreateObject("WScript.Shell").Run chr(34) & "C:\1548052.bat" & Chr(34), 0, False 'Измените директорию и 1548052 на название Вашего bat файла
End If
WScript.Sleep 3600000 'Тут уже поставил на один час принудительный перезапуск, можете поставить на 10000, для тестов
For Each Pr In WMI.ExecQuery("SELECT Name FROM Win32_Process WHERE Name='cmd.exe'")
        Pr.Terminate
Next

Loop