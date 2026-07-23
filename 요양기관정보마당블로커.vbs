Set UAC = CreateObject("Shell.Application")

UAC.ShellExecute "cmd.exe", "/c """ & _
CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName) & _
"\MedicalBlocker\MedicalBlocker.bat""", "", "runas", 1