#!/bin/bash
echo "========================================"
echo "  Internet Exposure Checker v1.0"
echo "========================================"
echo ""

PUBLIC_IP=$(curl -s http://ifconfig.me)
echo "Your Public IP: $PUBLIC_IP"
echo ""

echo "Listening ports:"
ss -tlnp | grep LISTEN
echo ""

echo "Testing port 22:"
nc -zv $PUBLIC_IP 22 2>&1
echo ""

echo "Done."
