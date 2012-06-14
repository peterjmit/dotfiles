#! /bin/sh
#
# Vboxme, a simple wrapper round VBoxManage for helping to start, stop and list
# (running) virtualboxes. Assumes that VBoxManage is on your $PATH.
#
# Author: Pete Mitchell <peterjmit@gmail.com>
#
# Inspired by Brendan Kidwell's <brendan@glump.net> virtualbox as a service
# http://www.glump.net/howto/virtualbox_as_a_service

MANAGE_CMD=VBoxManage
START_TYPE=headless
POWER_OFF=acpipowerbutton

usage() {
    echo "Vboxme 1.0 - Helper script for managing virtual machines with virtualbox"
    echo "Author: Pete Mitchell <peterjmit@gmail.com>"
    echo
    echo "Usage: `basename $0` [arguments] [options]"
    echo
    echo "Arguments:"
    echo "  -g         Start virtualbox in GUI mode instead of the default headless"
    echo "  -p <type>  Power off method (default: acpipowerbutton)"
    echo "  -z <path>  Provide absolute path to VBoxManage"
    echo
    echo "Options:"
    echo "  -s <name>  Start given virtualbox"
    echo "  -x <name>  Shutdown given virtualbox"
    echo "  -l         List available virtualboxes"
    echo "  -r         List running virtualboxes"
    echo "  -h         This help message"

}

# Starts virtual box $VM_NAME
startvm() {
    echo "Starting VBox: ${VM_NAME}"

    # Exit with error if the virtualbox is already running
    runningvms | grep ${VM_NAME} >/dev/null && {
        echo "${VM_NAME} is already running." >&2
        exit 1
    }

    # Start the vm in headless, if we fail then exit with error
    $MANAGE_CMD startvm "$VM_NAME" -type "$START_TYPE" >/dev/null || {
        echo "Failed to start ${VM_NAME}." >&2
        exit 2
    }

    # List the running vms
    runningvms

    # return success
    exit 0
}

# Shuts down virtualbox $VM_NAME with $POWER_OFF mode (default acpipowerbutton)
shutdownvm() {

    # Check the virtualbox is running, exit with error if it isn't
    runningvms | grep ${VM_NAME} >/dev/null || {
        echo "${VM_NAME} is already stopped." >&2
        exit 1
    }

    # Try the power off button, exit with error if we can't power off
    $MANAGE_CMD controlvm "$VM_NAME" "$POWER_OFF" || {
        echo "Failed to stop ${VM_NAME}." >&2
        exit 2
    }

    echo "${VM_NAME} turned off."

    exit 0
}

# Lists all the available vms
listvms() {
    echo "Virtual machines available:"
    $MANAGE_CMD list vms
}

# Lists all the running vms
runningvms() {
    echo "Virtual machines currently running:"

    $MANAGE_CMD list runningvms
}

# Option parsing
while getopts hlrgs:x:p:z: OPT
do
    case "$OPT" in
        h)
            usage
            exit 0
            ;;
        s)
            VM_NAME=$OPTARG
            startvm
            ;;
        x)
            VM_NAME=$OPTARG
            shutdownvm
            ;;
        l)
            listvms
            exit 0
            ;;
        r)
            runningvms
            exit 0
            ;;
        g)
            START_TYPE=gui
            ;;
        p)
            POWER_OFF=$OPTARG
            ;;
        z)
            MANAGE_CMD=$OPTARG
            ;;
        \?)
            usage
            exit 1
            ;;
    esac
done

shift `expr $OPTIND - 1`

# If none of the options are selected then display the usage
# and exit with an error. Otherwise this script wont do anything
usage
exit 1
