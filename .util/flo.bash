alias _flo_='lftp -p 2024 -u mkf,$(pass flounder.online/m@mikf.pl | head) sftp://flounder.online \
    -e '\''mirror -n --delete --exclude=^\.git/$ -P -v '
alias flogetn='_flo_ . /home/mf/flounderl/; bye'\'''
alias flopush='_flo_ -R /home/mf/flounderl/ .; bye'\'''
