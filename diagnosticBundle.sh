#!/bin/bash
mdatp log level set --level debug
sudo mdatp diagnostic create
sleep 20
mdatp log level set --level info