# Connect-RDP

A lightweight Windows batch utility that checks for port 3389 availability and automatically launches the Remote Desktop Connection (`mstsc`) client once the remote host is ready.

## How It Works

1. Repeatedly tests connection to the target host on TCP port 3389 using PowerShell (`Test-NetConnection`).
2. Retries every 10 seconds if the host is booting up or unreachable.
3. Once the port is open, caches the credentials locally with `cmdkey` and launches `mstsc`.

## Configuration

Open `Connect-RDP.bat` in a text editor to set your connection details:

```bat
set HOST=your-host-or-ip
set USER=your-username
```

And update the `cmdkey` line with your target password if automatic authentication is desired:

```bat
cmdkey /generic:TERMSRV/%HOST% /user:%USER% /pass:your-password >nul 2>&1
```

## Usage

Double-click `Connect-RDP.bat` or run it from the command line:

```cmd
Connect-RDP.bat
```

## Requirements

- Windows 10 or Windows 11
- PowerShell (available by default on Windows)
- Remote Desktop Connection enabled on the target host

## License

This utility is provided under the [MIT License](LICENSE).
