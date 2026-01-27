import tkinter as tk
import subprocess

# --- Functions to send commands to Linux ---
def send_key(key):
    subprocess.run(["xdotool", "key", key])

def press_key(key):
    subprocess.run(["xdotool", "keydown", key])

def release_key(key):
    subprocess.run(["xdotool", "keyup", key])

# --- Button Creator ---
def create_btn(parent, text, key, row, col, rowspan=1, colspan=1, color="#f0f0f0"):
    btn = tk.Button(parent, text=text, width=8, height=2, bg=color)
    btn.bind('<ButtonPress-1>', lambda e: press_key(key))
    btn.bind('<ButtonRelease-1>', lambda e: release_key(key))
    btn.grid(row=row, column=col, rowspan=rowspan, columnspan=colspan, padx=2, pady=2)

# --- Mouselook Toggle Logic ---
mouselook_active = False
def toggle_mouselook():
    global mouselook_active
    mouselook_active = not mouselook_active
    # 'm' is the default Singularity shortcut for Mouselook
    send_key("m") 
    if mouselook_active:
        ml_button.config(text="MLOOK: ON", bg="#ff9999")
    else:
        ml_button.config(text="MLOOK: OFF", bg="#99ff99")

# --- GUI Setup ---
root = tk.Tk()
root.title("iPad SL Control")
root.attributes('-topmost', True) 
root.geometry("280x220")

# Row 0: Mouselook & Fly
ml_button = tk.Button(root, text="MLOOK: OFF", width=18, height=2, bg="#99ff99", command=toggle_mouselook)
ml_button.grid(row=0, column=0, columnspan=2, padx=2, pady=2)
create_btn(root, "FLY (F)", "f", 0, 2, color="#add8e6")

# Row 1-3: D-Pad
create_btn(root, "FORWARD", "Up", 1, 1)
create_btn(root, "TURN L", "Left", 2, 0)
create_btn(root, "BACK", "Down", 3, 1)
create_btn(root, "TURN R", "Right", 2, 2)

# Row 2 center: Jump/Up
create_btn(root, "JUMP", "Prior", 2, 1, color="#ffff99")

# Row 4: Fly Down / Crouch
create_btn(root, "DOWN/C", "Next", 4, 1)

root.mainloop()
