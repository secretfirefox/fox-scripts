#!/bin/bash

# This script was written by Secret Firefox.
# Use this to disable automatic core dumps.
# This is especially useful so Steam games running under Proton do not write so much to RAM or Swap to the point it crashes your system.
# Enjoy!

# Create the configuration file to disable core dump

echo "kernel.core_pattern=|/bin/false" >> /etc/sysctl.d/50-coredump.conf

# Inform finished operation.

echo "Done."


