# Internet Exposure Checker

A simple security auditing tool that checks if services on your machine are exposed to the internet.

## What It Does

1. **Finds your public IP** - Know what address attackers would see
2. **Scans listening ports** - Identifies what services are running
3. **Tests external reachability** - Checks if services are actually accessible from the internet

## Sample Output

========================================
Internet Exposure Checker v1.0
========================================

Your Public IP: [YOUR_PUBLIC_IP_HERE]

Listening ports:
LISTEN 0 0 0.0.0.0:22 0.0.0.0:* users:(("sshd",pid=288,fd=6))
LISTEN 0 0 *:22 : users:(("sshd",pid=288,fd=7))

Testing port 22:
nc: connect to [YOUR_PUBLIC_IP_HERE] port 22 (tcp) failed: Connection refused

Done.


## Security Analysis

The tool identified:
- SSH is running on port 22
- It's listening on all interfaces
- **BUT** it's not reachable from the internet (connection refused)

This indicates:
- Service is configured correctly internally
- External firewall/NAT is providing protection
- Defense in depth is working

## Why This Matters

Most security breaches happen because:
1. People don't know what's exposed
2. They assume NAT protects them (it doesn't always)
3. They forget to check after configuration changes

This tool gives you:
- **Instant visibility** - See exactly what's exposed
- **Actionable insights** - Know which ports need attention
- **Peace of mind** - Verify your firewall rules work

## Skills Demonstrated

- Bash scripting
- Network security auditing
- Service exposure detection
- System administration
- Security best practices
- Technical documentation

## Technical Details

### How It Works

1. **Public IP Detection**: Uses `curl` to query `ifconfig.me`
2. **Port Scanning**: Uses `ss` to find listening services
3. **Reachability Testing**: Uses `netcat` (nc) to test external connectivity
4. **Vulnerability Identification**: Compares listening services with external reachability

### Dependencies

- `curl` - For public IP detection
- `ss` - For listening port detection
- `netcat` (nc) - For connectivity testing
- `grep` - For filtering output

### Installation

```bash
# Arch Linux
pacman -S curl netcat iproute2 grep

# Ubuntu/Debian
apt-get install curl netcat iproute2 grep

# Run
chmod +x exposure_checker.sh
./exposure_checker.sh


Use Cases

System Administrators - Audit new servers before deployment
Security Analysts - Quick exposure checks during assessments
Developers - Ensure dev environments aren't accidentally exposed
Penetration Testers - Initial reconnaissance tool
Limitations

Tests only specific ports (customizable)
Requires external reachability (works behind NAT)
Doesn't perform deep vulnerability scans
Future Improvements

Test multiple common ports (80, 443, 3306, etc.)
Add color-coded output for better readability
Support IPv4 and IPv6 detection
Add nmap integration for comprehensive scanning

Disclaimer: This tool is for educational and authorized testing purposes only.
