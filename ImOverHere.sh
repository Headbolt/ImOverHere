#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#   This Script is designed for use in JAMF
#
#   This script will check Location Services, and Enable if not switched on.
#
###############################################################################################################################################
#
# HISTORY
#
#   Version: 1.1 - 21/10/2019
#
#   - 17/01/2019 - V1.0 - Created by Headbolt
#
#   - 21/10/2019 - V1.1 - Updated by Headbolt
#                           More comprehensive error checking and notation
#
####################################################################################################
#
#   DEFINE VARIABLES & READ IN PARAMETERS
#
####################################################################################################
#
# Set the name of the script for later logging
ScriptName="append prefix here as needed - Enable Location Services"
#
####################################################################################################
#
#   Checking and Setting Variables Complete
#
###############################################################################################################################################
# 
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
# Defining Functions
#
###############################################################################################################################################
#
# SystemCheck Function
#
SystemCheck(){
#
/bin/echo "Checking System Location Services"
#
SystemCheck=$(sudo -u _locationd defaults -currentHost read com.apple.locationd LocationServicesEnabled)
#
if [ "$SystemCheck" == "1" ]
	then
		/bin/echo "System Location Services are ON"
		SystemServices=ON
	else
		/bin/echo "System Location Services are OFF"
		SystemServices=OFF
fi
#
}
#
###############################################################################################################################################
#
# SystemEnable Function
#
SystemEnable(){
#
sudo -u _locationd defaults -currentHost write com.apple.locationd LocationServicesEnabled -int 1
/bin/echo "Switching System Location Services ON"
}
#
###############################################################################################################################################
#
# Section End Function
#
SectionEnd(){
#
# Outputting a Blank Line for Reporting Purposes
/bin/echo
#
# Outputting a Dotted Line for Reporting Purposes
/bin/echo  -----------------------------------------------
#
# Outputting a Blank Line for Reporting Purposes
/bin/echo
#
}
#
###############################################################################################################################################
#
# Script End Function
#
ScriptEnd(){
#
# Outputting a Blank Line for Reporting Purposes
#/bin/echo
#
/bin/echo Ending Script '"'$ScriptName'"'
#
# Outputting a Blank Line for Reporting Purposes
/bin/echo
#
# Outputting a Dotted Line for Reporting Purposes
/bin/echo  -----------------------------------------------
#
# Outputting a Blank Line for Reporting Purposes
/bin/echo
#
}
#
###############################################################################################################################################
#
# End Of Function Definition
#
###############################################################################################################################################
#
# Beginning Processing
#
###############################################################################################################################################
#
# Outputting a Blank Line for Reporting Purposes
/bin/echo
SectionEnd
#
SystemCheck
SectionEnd
#
if [ $SystemServices == "OFF" ]
	then
		SystemEnable
		SectionEnd
		SystemCheck
		SectionEnd
	else
		SystemServices=ON
fi
#
ScriptEnd
