#!/usr/bin/env python3
"""
Extract Instagram cookies from Chrome browser (macOS/Linux).
Run on your local machine (where Chrome is logged into Instagram).

Usage:
  python3 extract_cookies.py > instagram_cookies.txt
  scp instagram_cookies.txt your-vm:~/.openclaw/workspace/.cookies/instagram.txt

Requires: pip install browser-cookie3
"""

import sys
import http.cookiejar
import tempfile
import os

try:
    import browser_cookie3
except ImportError:
    print("Install dependency first: pip3 install browser-cookie3", file=sys.stderr)
    sys.exit(1)

def extract_instagram_cookies(browser='chrome'):
    """Extract Instagram cookies and output in Netscape cookies.txt format."""

    # Try to get cookies from browser
    try:
        if browser == 'chrome':
            cj = browser_cookie3.chrome(domain_name='.instagram.com')
        elif browser == 'firefox':
            cj = browser_cookie3.firefox(domain_name='.instagram.com')
        elif browser == 'edge':
            cj = browser_cookie3.edge(domain_name='.instagram.com')
        elif browser == 'brave':
            cj = browser_cookie3.brave(domain_name='.instagram.com')
        else:
            print(f"Unsupported browser: {browser}", file=sys.stderr)
            sys.exit(1)
    except Exception as e:
        print(f"Error reading {browser} cookies: {e}", file=sys.stderr)
        print("Make sure the browser is closed (or try with it open).", file=sys.stderr)
        sys.exit(1)

    # Output in Netscape cookies.txt format
    print("# Netscape HTTP Cookie File")
    print("# https://curl.se/docs/http-cookies.html")
    print("# This file was generated automatically. Do not edit.")
    print()

    count = 0
    for cookie in cj:
        if 'instagram.com' in cookie.domain:
            secure = "TRUE" if cookie.secure else "FALSE"
            domain_dot = "TRUE" if cookie.domain.startswith('.') else "FALSE"
            expires = str(cookie.expires) if cookie.expires else "0"
            print(f"{cookie.domain}\t{domain_dot}\t{cookie.path}\t{secure}\t{expires}\t{cookie.name}\t{cookie.value}")
            count += 1

    print(f"\n# Extracted {count} Instagram cookies from {browser}", file=sys.stderr)
    if count == 0:
        print("WARNING: No cookies found! Make sure you're logged into Instagram in this browser.", file=sys.stderr)

if __name__ == '__main__':
    browser = sys.argv[1] if len(sys.argv) > 1 else 'brave'
    extract_instagram_cookies(browser)
