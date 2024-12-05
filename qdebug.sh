set -e
. ./iso.sh

qemu-system-$(./target-triplet-to-arch.sh $HOST) -no-reboot -d int,mmu -cdrom myos.iso
