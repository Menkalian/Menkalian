#!/bin/bash
#
# Updates the motd to match my personal preference
#
# Tested versions:
#   - Ubuntu 20.04

if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root"
  exit
fi

cd /etc/update-motd.d

# Overwrite scripts
cat << EOF > 00-header
#!/bin/sh
#
# Modifizierter MotD-Header
# 2022 kkrampf

printf "
\033[38;5;45m                .,-:;//;:=,                                                    _                                        \033[39m
\033[38;5;45m            . :H@@@MM@M#H/.,+&;,                 /\                           | |                                       \033[39m
\033[38;5;45m         ,/X+ +M@@M@MM&=,-&HMMM@X/,             /  \     _ __     ___   _ __  | |_   _   _   _ __    ___                \033[39m
\033[38;5;45m       -+@MM; §M@@MH+-,;XMMMM@MMMM@+-          / /\ \   | '_ \   / _ \ | '__| | __| | | | | | '__|  / _ \               \033[39m
\033[38;5;45m      ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.       / ____ \  | |_) | |  __/ | |    | |_  | |_| | | |    |  __/               \033[39m
\033[38;5;45m    ,&MM@@MH ,@&=             .---=-=:=,.    /_/    \_\ | .__/   \___| |_|     \__|  \__,_| |_|     \___|               \033[39m
\033[38;5;45m    =@#@@@MX.,                -&HX§§&&&:;               | |                                                             \033[39m
\033[38;5;45m   =-./@M@M§                   .;@MMMM@MM:              |_|                                                             \033[39m
\033[38;5;45m   X@/ -§MM/                    . +MM@@@M§     _____          _                                                         \033[39m
\033[38;5;45m  ,@M@H: :@:                    . =X#@@@@-    / ____|        (_)                                                        \033[39m
\033[38;5;45m  ,@@@MMX, .                    /H- ;@M@M=   | (___     ___   _    ___   _ __     ___    ___                            \033[39m
\033[38;5;45m  .H@@@@M@+,                    &MM+..&#§.    \___ \   / __| | |  / _ \ | '_ \   / __|  / _ \                           \033[39m
\033[38;5;45m   /MMMM@MMH/.                  XM@MH; =;     ____) | | (__  | | |  __/ | | | | | (__  |  __/                           \033[39m
\033[38;5;45m    /&+&§XHH@§=              , .H@@@@MX,     |_____/   \___| |_|  \___| |_| |_|  \___|  \___|                           \033[39m
\033[38;5;45m     .=--------.           -&H.,@@@@@MX,                                                                                \033[39m
\033[38;5;45m     .&MM@@@HHHXX§§§&+- .:§MMX =M@@MM&.       _             _                         _                 _               \033[39m
\033[38;5;45m       =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=        | |     __ _  | |__   ___   _ _   __ _  | |_   ___   _ _  (_)  ___   ___   \033[39m
\033[38;5;45m         =&@M@M#@§-.=§@MM@@@M; &M&=          | |__  / _' | | '_ \ / _ \ | '_| / _' | |  _| / _ \ | '_| | | / -_) (_-<   \033[39m
\033[38;5;45m           ,:+§+-,/H#MMMMMMM@= =,            |____| \__,_| |_.__/ \___/ |_|   \__,_|  \__| \___/ |_|   |_| \___| /__/   \033[39m
\033[38;5;45m                 =++&&&&+/:-.                                                                                           \033[39m
"

printf "\033[38;5;214m
Running %s %s %s \033[39m\n" "\$(uname -o)" "\$(uname -r)" "\$(uname -m)"
EOF

cat << EOF > 11-cake
#!/bin/bash
#
# Prints cake on my birthday and with some chance on any other day :)
#

function print_cake() {
    printf "

\033[38;5;208m              ,:/+/-                                                                                                   \033[39m
\033[38;5;208m              /M/              .,-=;//;-                                                                               \033[39m
\033[38;5;208m         .:/= ;MH/,    ,=/+&§XH@MM#@:                                                                                  \033[39m
\033[38;5;208m        -§##@+§###@H@MMM#######H:.    -/H#                                                                             \033[39m
\033[38;5;208m   .,H@H@ X######@ -H#####@+-     -+H###@X     @@@@@@@ @@@  @@@ @@@@@@@@ @@@@@@@  @@@@@@@@                             \033[39m
\033[38;5;208m    .,@##H;      +XM##M/,     =&@###@X;-         @@!   @@!  @@@ @@!      @@!  @@@ @@!                                  \033[39m
\033[38;5;208m  X&-  :M##########§.    .:&M###@&:              @!!   @!@!@!@! @!!!:!   @!@!!@!  @!!!:!                               \033[39m
\033[38;5;208m  M##H,   +H@@@§/-.  ,;§M###@&,          -       !!:   !!:  !!! !!:      !!: :!!  !!:                                  \033[39m
\033[38;5;208m  M####M=,,---,.-&&H####M§:          ,+@##        :     :   : : : :: :::  :   : : : :: :::                             \033[39m
\033[38;5;208m  @##################@/.         :&H##@§-                                                                              \033[39m
\033[38;5;208m  M###############H,         ;HM##M§=            @@@  @@@@@@       @@@@@@@  @@@@@@  @@@  @@@ @@@@@@@@                  \033[39m
\033[38;5;208m  #################.    .=§M##M§=                @@! !@@          !@@      @@!  @@@ @@!  !@@ @@!                       \033[39m
\033[38;5;208m  ################H..;XM##M§=          .:+       !!@  !@@!!       !@!      @!@!@!@! @!@@!@!  @!!!:!                    \033[39m
\033[38;5;208m  M###################@&=           =+@MH&       !!:     !:!      :!!      !!:  !!! !!: :!!  !!:                       \033[39m
\033[38;5;208m  @################M/.          =+H#X&=          :   ::.: :        :: :: :  :   : :  :   ::: : :: :::                  \033[39m
\033[38;5;208m  =+M##############M,       -/X#X+;.                                                                                   \033[39m
\033[38;5;208m    .;XM##########H=    ,/X#H+:,                                                                                       \033[39m
\033[38;5;208m       .=+HM######M+/+HM@+=.                                                                                           \033[39m
\033[38;5;208m           ,:/&XM####H/.                                                                                               \033[39m
\033[38;5;208m                ,.:=-.                                                                                                 \033[39m

"
}

today=\$(date +"%m-%d")

if [ "\$today" = "01-07" ]; then
    print_cake
else
    if [ \$RANDOM -lt 1024 ]; then
        print_cake
    fi
fi
EOF

cat << EOF > 40-sysinfo
#!/bin/sh
# pam_motd does not carry the environment
[ -f /etc/default/locale ] && . /etc/default/locale
export LANG

printf "
\033[38;5;229mToday is the %s.
\033[38;5;191m
------------------------------------------------- SYSTEM-INFORMATION --------------------------------------------------
%s
-----------------------------------------------------------------------------------------------------------------------
\033[39m" "\$(/bin/date)" "\$(/usr/bin/landscape-sysinfo)"
EOF

chmod +x 11-cake
chmod +x 40-sysinfo

# Remove unwanted information
rm 10-help-text
rm 50-motd-news
unlink 50-landscape-sysinfo

echo "Successfully updated motd"
rm ~/.motd_shown
