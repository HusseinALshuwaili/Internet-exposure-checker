# Portfolio Project: Internet Exposure Checker

## Project Overview
A security auditing tool I developed to identify exposed services on Linux systems. This tool helps system administrators and security professionals quickly assess their attack surface.

## The Problem
Many organizations don't know which services are actually exposed to the internet. Services listening locally might be accessible externally due to misconfigured firewalls, NAT rules, or incorrect service bindings.

## My Solution
I built a Bash script that:
1. Detects all listening ports on a system
2. Identifies which services are bound to all interfaces (0.0.0.0)
3. Cross-references with the public IP address
4. Tests reachability from external vantage points
5. Provides clear, actionable recommendations

## Technical Approach
- **Language**: Bash
- **Tools**: curl, ss, netcat, grep
- **Methodology**: OWASP recommended practices for exposure detection
- **Testing**: Validated on Arch Linux ARM (UTM on Mac Air M5)

## Results
The tool successfully identified:
- SSH service running on port 22
- Service bound to all interfaces (0.0.0.0)
- External connectivity was blocked by NAT/firewall (connection refused)
- Defense in depth is working correctly

## Value to Clients
- **Immediate insight**: Know what's exposed in under 30 seconds
- **Actionable**: Get specific recommendations, not vague warnings
- **Cost-effective**: Catch misconfigurations before attackers do
- **Zero dependencies**: Runs with standard system tools (no installation needed)

## Skills Demonstrated
- Network security auditing
- Bash scripting
- System administration
- Security architecture analysis
- Technical writing (clear, actionable reporting)

## Sample Output
========================================
Internet Exposure Checker v1.0
========================================

Your Public IP: [YOUR_PUBLIC_IP_HERE]

Listening ports:
LISTEN 0 0 0.0.0.0:22 0.0.0.0:* users:(("sshd",pid=288,fd=6))

Testing port 22:
nc: connect to [YOUR_PUBLIC_IP_HERE] port 22 (tcp) failed: Connection refused


## Security Impact
This tool helps organizations:
- Identify unauthorized services running on production servers
- Verify firewall rules are working as expected
- Detect configuration drift in development environments
- Reduce attack surface by identifying unnecessary exposures

---

*This project demonstrates my ability to build practical security tools and communicate findings effectively.*
