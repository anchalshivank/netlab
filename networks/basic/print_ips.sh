#!/bin/sh

# Print IP addresses with their interfaces
ifconfig | awk '/^eth|^lo/{iface=$1} /inet /{print iface ": " $2}'
