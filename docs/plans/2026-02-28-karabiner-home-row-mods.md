# Karabiner Home Row Mods Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add a Karabiner-Elements config with CAGS home row mods and Caps Lock → Escape to the dotfiles repo.

**Architecture:** Single `karabiner.json` file in `.config/karabiner/` managed via GNU Stow. Uses native complex modifications with `to_if_alone` / `to_if_held_down` for tap/hold behavior.

**Tech Stack:** Karabiner-Elements, JSON, GNU Stow

---

### Task 1: Create karabiner.json with scaffolding and Caps Lock → Escape

**Files:**
- Create: `.config/karabiner/karabiner.json`

**Step 1: Create the karabiner directory**

```bash
mkdir -p .config/karabiner
```

**Step 2: Write the base karabiner.json with Caps Lock → Escape rule**

Create `.config/karabiner/karabiner.json`:

```json
{
    "global": {
        "check_for_updates_on_startup": true,
        "show_in_menu_bar": true,
        "show_profile_name_in_menu_bar": false
    },
    "profiles": [
        {
            "name": "Default",
            "selected": true,
            "complex_modifications": {
                "parameters": {
                    "basic.to_if_alone_timeout_milliseconds": 200,
                    "basic.to_if_held_down_threshold_milliseconds": 200,
                    "basic.to_delayed_action_delay_milliseconds": 200
                },
                "rules": [
                    {
                        "description": "Caps Lock to Escape",
                        "manipulators": [
                            {
                                "type": "basic",
                                "from": {
                                    "key_code": "caps_lock",
                                    "modifiers": { "optional": ["any"] }
                                },
                                "to": [{ "key_code": "escape" }]
                            }
                        ]
                    }
                ]
            }
        }
    ]
}
```

**Step 3: Commit**

```bash
git add .config/karabiner/karabiner.json
git commit -m "feat: add karabiner config with caps lock to escape"
```

---

### Task 2: Add left-hand home row mods (A, S, D, F)

**Files:**
- Modify: `.config/karabiner/karabiner.json`

**Step 1: Add the CAGS left-hand rule**

Add a new rule to the `rules` array after the Caps Lock rule:

```json
{
    "description": "Home Row Mods - Left Hand (CAGS)",
    "manipulators": [
        {
            "type": "basic",
            "from": { "key_code": "a", "modifiers": { "optional": ["any"] } },
            "to": [{ "key_code": "left_control", "lazy": true }],
            "to_if_alone": [{ "key_code": "a" }],
            "to_if_held_down": [{ "key_code": "left_control" }],
            "parameters": {
                "basic.to_if_alone_timeout_milliseconds": 200,
                "basic.to_if_held_down_threshold_milliseconds": 200
            }
        },
        {
            "type": "basic",
            "from": { "key_code": "s", "modifiers": { "optional": ["any"] } },
            "to": [{ "key_code": "left_option", "lazy": true }],
            "to_if_alone": [{ "key_code": "s" }],
            "to_if_held_down": [{ "key_code": "left_option" }],
            "parameters": {
                "basic.to_if_alone_timeout_milliseconds": 200,
                "basic.to_if_held_down_threshold_milliseconds": 200
            }
        },
        {
            "type": "basic",
            "from": { "key_code": "d", "modifiers": { "optional": ["any"] } },
            "to": [{ "key_code": "left_command", "lazy": true }],
            "to_if_alone": [{ "key_code": "d" }],
            "to_if_held_down": [{ "key_code": "left_command" }],
            "parameters": {
                "basic.to_if_alone_timeout_milliseconds": 200,
                "basic.to_if_held_down_threshold_milliseconds": 200
            }
        },
        {
            "type": "basic",
            "from": { "key_code": "f", "modifiers": { "optional": ["any"] } },
            "to": [{ "key_code": "left_shift", "lazy": true }],
            "to_if_alone": [{ "key_code": "f" }],
            "to_if_held_down": [{ "key_code": "left_shift" }],
            "parameters": {
                "basic.to_if_alone_timeout_milliseconds": 200,
                "basic.to_if_held_down_threshold_milliseconds": 200
            }
        }
    ]
}
```

**Step 2: Commit**

```bash
git add .config/karabiner/karabiner.json
git commit -m "feat: add left-hand CAGS home row mods"
```

---

### Task 3: Add right-hand home row mods (J, K, L, ;)

**Files:**
- Modify: `.config/karabiner/karabiner.json`

**Step 1: Add the CAGS right-hand rule**

Add a new rule to the `rules` array:

```json
{
    "description": "Home Row Mods - Right Hand (CAGS)",
    "manipulators": [
        {
            "type": "basic",
            "from": { "key_code": "j", "modifiers": { "optional": ["any"] } },
            "to": [{ "key_code": "right_shift", "lazy": true }],
            "to_if_alone": [{ "key_code": "j" }],
            "to_if_held_down": [{ "key_code": "right_shift" }],
            "parameters": {
                "basic.to_if_alone_timeout_milliseconds": 200,
                "basic.to_if_held_down_threshold_milliseconds": 200
            }
        },
        {
            "type": "basic",
            "from": { "key_code": "k", "modifiers": { "optional": ["any"] } },
            "to": [{ "key_code": "right_command", "lazy": true }],
            "to_if_alone": [{ "key_code": "k" }],
            "to_if_held_down": [{ "key_code": "right_command" }],
            "parameters": {
                "basic.to_if_alone_timeout_milliseconds": 200,
                "basic.to_if_held_down_threshold_milliseconds": 200
            }
        },
        {
            "type": "basic",
            "from": { "key_code": "l", "modifiers": { "optional": ["any"] } },
            "to": [{ "key_code": "right_option", "lazy": true }],
            "to_if_alone": [{ "key_code": "l" }],
            "to_if_held_down": [{ "key_code": "right_option" }],
            "parameters": {
                "basic.to_if_alone_timeout_milliseconds": 200,
                "basic.to_if_held_down_threshold_milliseconds": 200
            }
        },
        {
            "type": "basic",
            "from": { "key_code": "semicolon", "modifiers": { "optional": ["any"] } },
            "to": [{ "key_code": "right_control", "lazy": true }],
            "to_if_alone": [{ "key_code": "semicolon" }],
            "to_if_held_down": [{ "key_code": "right_control" }],
            "parameters": {
                "basic.to_if_alone_timeout_milliseconds": 200,
                "basic.to_if_held_down_threshold_milliseconds": 200
            }
        }
    ]
}
```

**Step 2: Commit**

```bash
git add .config/karabiner/karabiner.json
git commit -m "feat: add right-hand CAGS home row mods"
```

---

### Task 4: Validate and stow

**Step 1: Validate the JSON is well-formed**

```bash
python3 -c "import json; json.load(open('.config/karabiner/karabiner.json')); print('Valid JSON')"
```

Expected: `Valid JSON`

**Step 2: Run stow to symlink into ~/.config**

```bash
./stow.sh
```

Expected: Karabiner config symlinked to `~/.config/karabiner/karabiner.json`

**Step 3: Verify symlink exists**

```bash
ls -la ~/.config/karabiner/karabiner.json
```

Expected: Symlink pointing to dotfiles repo.

**Step 4: Commit any stow-related changes if needed, then push**

```bash
git push
```
