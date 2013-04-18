.PHONY: all install uninstall

all: 
	@echo -n "Directory check"
	@if [ ! -d "/usr/sbin" ]; then echo "Cant find /usr/sbin! WTF?"; exit 1; fi
	@if [ ! -d "/etc/kernel/postinst.d/" ]; then echo "Cant find /etc/kernel/postinst.d! Efiqo cant be installed"; exit 1; fi
	@echo "\t\t[OK]"
	@echo -n "Preliminar check"
	@bash checkall.sh
	@if [ $$? -eq 1 ] ; then exit 1; fi
	@echo "\t\t[OK]"
	@echo -n "Binary check"
	@ type efibootmgr > /dev/null
	@if [ $$? -eq 1 ] ; then echo "efibootmgr not found! Please check the prerequisites before installing efiqo."; exit 1; fi
	@ type iconv > /dev/null 
	@if [ $$? -eq 1 ] ; then echo "iconv not found! Please check the prerequisites before installing efiqo."; exit 1; fi
	@echo "\t\t[OK]"

install: all
	@if [ `whoami` != root ]; then echo "You must be root for install efiqo"; exit 1; fi
	install confa /etc/default/efiqo
	install -m 0755 efiqo /usr/sbin/
	install efiqo-update /etc/kernel/postinst.d/
	@echo "Enjoy EFIqo"

uninstall:
	@if [ `whoami` != root ]; then echo "You must be root for uninstall efiqo"; exit 1; fi
	@source /etc/default/efiqo; rm -rf $MOUNTP/EFI/efiqo;
	@rm -rf /etc/default/efiqo
	@rm -rf /usr/sbin/efiqo.sh
	@rm -rf /etc/kernel/postinst.d/efiqo-update

.NOEXPORT:
