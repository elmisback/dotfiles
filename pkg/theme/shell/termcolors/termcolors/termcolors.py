#!/usr/bin/env python
from __future__ import print_function
import argparse
import os
import pickle
import sys

USER_FILE = os.path.join(os.path.dirname(__file__), 'user.dat')

# TODO Maybe implement these switches for light backgrounds.
#  if a:color == s:cterm00
#    return s:cterm07
#  elseif a:color == s:cterm01
#    return s:cterm06
#  elseif a:color == s:cterm02
#    return s:cterm05
#  elseif a:color == s:cterm03
#    return s:cterm04

def parse_args():
    parser = argparse.ArgumentParser(
        description="sets terminal colors 0 - 21")
    # TODO
    #add = argparse.ArgumentParser(
    #    description="adds a theme")
    #rm = argparse.ArgumentParser(
    #    description="removes a theme")
    #bg = argparse.ArgumentParser(
    #    description="sets the background")
    #cs = argparse.ArgumentParser(
    #    description="sets the cursor color")
    #ls = argparse.ArgumentParser(
    #    description="lists the current colors")
    #parser.add_subparser(add)
    #parser.add_subparser(rm)
    #parser.add_subparser(bg)
    #parser.add_subparser(theme)
    parser.add_argument(
        '-f', '--file', type=argparse.FileType('r'),
        help='a file with colors on each line as hex values, eg. "ffffff"')
    parser.add_argument(
        '-b', '--brightness', type=int,
        help='an integer brightness in the range 0 to 2')
    return parser.parse_args()

def term_color_template():
    tmux = os.getenv('TMUX')
    term = (os.getenv('TERM') or os.getenv('TERMINAL'))
    if tmux and len(tmux) > 0:
        return '\033Ptmux;\033\033]{};rgb:{}\033\033\\\033\\'
    elif term and term.startswith('screen'):
        return '\033P\033]{};rgb:{}\033\\'
    else:
        return '\033]{};rgb:{}\033\\'

def system_color_template():
    """Gets a suitable ANSI template for the terminal emulator."""
    tmux = os.getenv('TMUX')
    term = (os.getenv('TERM') or os.getenv('TERMINAL'))
    if tmux and len(tmux) > 0:
        return '\033Ptmux;\033\033]{};{};rgb:{}\033\033\\\033\\'
    elif term and term.startswith('screen'):
        return '\033P\033]{};{};rgb:{}\033\\'
    else:
        return '\033]{};{};rgb:{}\033\\'

def set_term_colors(colors):
    """Sets terminal colors 0 - 21."""
    tmp = system_color_template()
    system_color_target = 4

    for i, c in enumerate(colors):
        # Emits the proper ANSI code
        print(tmp.format(system_color_target, i, c), end='')

def _cleanup(line):
    line = line.strip()[:8]
    if len(line) == 6:
        line = "{}/{}/{}".format(line[:2], line[2:4], line[4:])
    return line

def update_user(data, colorfile, brightness):
    if colorfile:
        # Validate the file.
        colors = [_cleanup(l) for l in colorfile.readlines()]
        data['colors'] = colors

    if brightness is not None:
        data['brightness'] = brightness
    elif data.get('brightness') is None:
        data['brightness'] = 1

def set_fg(colors, brightness):
    tmp = term_color_template()
    fg_target = 10
    if brightness == 1:
        fg_color = 7
    else:
        fg_color = 8
    print(tmp.format(fg_target, colors[fg_color]), end='')

def set_bg(colors, brightness):
    tmp = term_color_template()
    bg_target = 11
    bg_color = 0 if brightness < 2 else 15
    print(tmp.format(bg_target, colors[bg_color]), end='')

def set_cs(colors):
    tmp = term_color_template()
    cs_target = 12
    cs_color = 6
    print(tmp.format(cs_target, colors[cs_color]), end='')

def cli():
    args = parse_args()
    if not os.path.exists(USER_FILE):
        user = {}
    else:
        with open(USER_FILE, 'r') as f:
            user = pickle.load(f)
    update_user(user, colorfile=args.file, brightness=args.brightness)

    if not user.get('colors'):
        print('Please specify a color file with -f.')
        sys.exit(1)
    colors = user['colors']
    set_term_colors(colors)

    brightness = user['brightness']
    set_bg(colors, brightness)
    set_fg(colors, brightness)
    set_cs(colors)

    with open(USER_FILE, 'w') as f:
        pickle.dump(user, f)

if __name__ == "__main__":
    cli()
