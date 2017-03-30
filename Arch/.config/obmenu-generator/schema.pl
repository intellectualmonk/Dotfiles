#!/usr/bin/perl
 
# obmenu-generator - schema file
 
=for comment
 
    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    raw:       any valid Openbox XML string               {raw => q(xml string)},
    begin_cat: begin of a category                  {begin_cat => ["name", "icon"]},
    end_cat:   end of a category                      {end_cat => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},
 
=cut
 
# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)
 
require "$ENV{HOME}/.config/obmenu-generator/config.pl";

our $SCHEMA = [
    #             COMMAND                 LABEL                ICON
{begin_cat => ['File', 'File-manager']},
    {item => ['thunar',           'File',      'file-manager']},
{end_cat => undef},
{begin_cat => ['Terminal', 'Terminal']},
    {item => ['lxterminal',           'Lxterm',      'terminal']},
    {item => ['urxvt',           'Urxvt',      'terminal']},
{end_cat => undef},
{begin_cat => ['Browser', 'Browser']},    
    {item => ['firefox',           'Firefox',       'web-browser']},
    {item => ['sh ~/Documents/Tor/tor-browser_en-US64/Browser/start-tor-browser',           'Tor',       'web-browser']},
{end_cat => undef},
    {sep => undef},
    {item => ['~/scripts/dmenu.sh',         'Run',       'system-run']},

    {sep => undef},



    {raw => q(<menu id="Applications" label="Applications">)},
        #          NAME            LABEL                ICON
        {cat => ['utility',     'Accessories', 'applications-utilities']},
        {cat => ['development', 'Development', 'applications-development']},
        {cat => ['education',   'Education',   'applications-science']},
        {cat => ['game',        'Games',       'applications-games']},
        {cat => ['graphics',    'Graphics',    'applications-graphics']},
        {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
        {cat => ['network',     'Network',     'applications-internet']},
        {cat => ['office',      'Office',      'applications-office']},
        {cat => ['settings',    'Settings',    'applications-accessories']},
        {cat => ['system',      'System',      'applications-system']},
    {raw => q(</menu>)},

#   {raw => q(<menu execute="~/.config/openbox/pipemenus/obpipemenu-places ~/" id="places" label="Places"/>)},
#  {raw => q(<menu execute="~/.config/openbox/pipemenus/obrecent.sh ~/" id="recent" label="Recent Files"/>)},
#  {raw => q(<menu execute="~/.config/openbox/pipemenus/obkeypipe" id="keybinds" label="Openbox Keys"/>)},
{raw => q(<menu id="Wallpaper" label="Wallpaper">)},
    {raw => q(<menu execute="~/.config/openbox/pipemenus/fehpipe" id="fehback" label="Color"/>)},
    {raw => q(<menu execute="~/.config/openbox/pipemenus/fehpipe1" id="fehback1" label="Anime"/>)},
    {raw => q(<menu execute="~/.config/openbox/pipemenus/fehpipe2" id="fehback2" label="Minimalist"/>)},
{raw => q(</menu>)},
        {raw => q(<menu id="Preferences" label="Preferences">)},
        {raw => q(<menu id="Screenshot" label="Take Screenshot">)},
            {raw => q(<item label="Now"><action name="Execute"><execute>scrot '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ~/ &amp; gpicview ~/$f'</execute></action></item>)},
            {raw => q(<item label="In 10 Seconds..."><action name="Execute"><execute>scrot -d 10 '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ~/ &amp; gpicview ~/$f'</execute></action></item>)},
            {raw => q(<item label="Selected Area... click &amp; drag mouse"><action name="Execute"><execute>scrot -s '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ~/ &amp; gpicview ~/$f'</execute></action></item>)},
        {raw => q(</menu>)},
#       {item => ['obkey',   'Edit Key Bindings',   undef]},
        {obgenmenu => 'Openbox Settings'},
        {raw => q(</menu>)},
        
        {sep       => undef},
    {raw => q(<menu id="Exit" label="Exit">)},
        # This options uses the default OpenBox action "Exit"
        {exit => ['Exit', 'exit']},
        {item => ['systemctl reboot', 'Reboot', undef]},
        {item => ['systemctl poweroff', 'Shutdown', undef]},
    {raw => q(</menu>)},
]