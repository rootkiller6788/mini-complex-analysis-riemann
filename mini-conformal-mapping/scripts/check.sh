#!/bin/bash
# Smoke check script for mini-conformal-mapping
echo "mini-conformal-mapping check..."
lake build 2>&1 && echo "BUILD OK" || echo "BUILD FAILED"
