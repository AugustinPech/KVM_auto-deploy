#! /usr/bin/env bash
userName=$1
name=$2

function ipVM {
  sleep 1
  macVM=$(virsh dumpxml "$name" | grep "mac address" | awk -F\' '{print $2}')
  ipVM=$(arp -an | grep "$macVM" | awk -F'(' '{print $2}' | awk -F')' '{print $1}')
  echo "VM's IP = " "$ipVM"
}
function PAMUSBspecifics {
  scp -o StrictHostKeyChecking=no ./scripts/installPAMAtempt.sh "$userName"@"$ipVM":/tmp/ # tocomment
  ssh -o StrictHostKeyChecking=no "$userName"@"$ipVM" 'chmod 755 /tmp/installPAMAtempt.sh' # tocomment
  # ssh -o StrictHostKeyChecking=no "$userName"@"$ipVM" 'bash /tmp/installPAMAtempt.sh' # tocomment
  USB_DEVICE=$(lsusb | grep -i "Verbatim")

  if [ -z "$USB_DEVICE" ]; then
      echo "Verbatim USB device not found."
      exit 1
  fi
  VENDOR_ID=$(echo $USB_DEVICE | awk '{print $6}' | cut -d':' -f1)
  PRODUCT_ID=$(echo $USB_DEVICE | awk '{print $6}' | cut -d':' -f2)
  BUS_ID=$(echo "$USB_DEVICE" | awk '{print $2}')
  DEVICE_ID=$(echo "$USB_DEVICE" | awk '{print $4}' | sed 's/://')

  # Attach the USB device to the VM
  virsh attach-device "$name" <(cat <<EOF
  <hostdev mode='subsystem' type='usb' managed='yes'>
    <source>
      <vendor id='0x$VENDOR_ID'/>
      <product id='0x$PRODUCT_ID'/>
    </source>
  </hostdev>
EOF
  )
}
ipVM
PAMUSBspecifics