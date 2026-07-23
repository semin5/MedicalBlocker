using Microsoft.Win32;
using System.Diagnostics;
using System.Windows.Forms;

try
{
    Registry.SetValue(
        @"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist",
        "1",
        "gbeidpjnfdffofgneihdaajhojelbhib;https://clients2.google.com/service/update2/crx");

    Registry.SetValue(
        @"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist",
        "1",
        "bbljeemcmekgdbonkldfofcdineneeoj;https://edge.microsoft.com/extensionwebstorebase/v1/crx");

    foreach (string process in new[] { "chrome", "msedge" })
    {
        foreach (Process p in Process.GetProcessesByName(process))
        {
            try
            {
                p.Kill();
                p.WaitForExit();
            }
            catch { }
        }
    }

    Process.Start(new ProcessStartInfo
    {
        FileName = "gpupdate.exe",
        Arguments = "/target:computer /force",
        UseShellExecute = false,
        CreateNoWindow = true
    })?.WaitForExit();

    MessageBox.Show(
        "MedicalBlocker 설치가 완료되었습니다.\n\nChrome 또는 Edge를 다시 실행하면 자동으로 설치됩니다.",
        "MedicalBlocker",
        MessageBoxButtons.OK,
        MessageBoxIcon.Information);
}
catch (Exception ex)
{
    MessageBox.Show(
        ex.Message,
        "오류",
        MessageBoxButtons.OK,
        MessageBoxIcon.Error);
}