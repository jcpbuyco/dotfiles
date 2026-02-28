# Karabiner-Elements Home Row Mods

## Overview

Add a Karabiner-Elements configuration to the dotfiles repo implementing CAGS home row mods and Caps Lock to Escape.

## File Structure

New directory `.config/karabiner/` containing `karabiner.json`. Stowed via existing `stow.sh` which already handles all of `.config/`.

## Rules

### Rule 1: CAGS Home Row Mods

Each home row key uses tap/hold dual behavior:

| Key | Tap    | Hold            |
|-----|--------|-----------------|
| A   | a      | left_control    |
| S   | s      | left_option     |
| D   | d      | left_command    |
| F   | f      | left_shift      |
| J   | j      | right_shift     |
| K   | k      | right_command   |
| L   | l      | right_option    |
| ;   | ;      | right_control   |

### Rule 2: Caps Lock to Escape

Simple key swap — Caps Lock sends Escape on tap. No hold behavior.

## Timing Parameters

- `to_if_alone_timeout_milliseconds`: 200ms
- `to_delayed_action_delay_milliseconds`: 200ms
- `parameters.basic.to_if_held_down_threshold_milliseconds`: 200ms

## Implementation Approach

Native `karabiner.json` complex modifications. Each key uses:
- `from.key_code`: the letter key
- `to_if_alone.key_code`: same letter (tap behavior)
- `to_if_held_down.key_code`: the modifier (hold behavior)

## Approach Decision

Chose native JSON over Goku DSL or community imports to keep it dependency-free and consistent with existing dotfiles patterns.
