# PICfix2

PICfix2 is a modernized version of the classic PlayStation 2 Matrix PICfix circuit.

The goal of this project is not to change what PICfix does. The goal is to improve how the PICfix circuit interfaces with the PS2 reset line so the protection circuit can do its job without loading or disturbing the console’s normal reset circuit.

PICfix2 keeps the original purpose of PICfix:

> Detect a MechaCon / DVD-controller communication crash condition and force the console into shutdown/reset before the optical pickup coils can be damaged.

## Why PICfix Exists

Some PlayStation 2 models are known to suffer from a laser-killing failure condition. When the MechaCon crashes while the DVD system is still active, the console may continue driving the tracking and focus coils. If the console is left in this crashed state, the driver outputs can saturate and the optical pickup coils may overheat or burn.

The original Matrix PICfix was created as a simple, low-cost hardware protection circuit using a PIC12C508 microcontroller. The PIC monitors the communication between the mechanics controller and DVD controller. If the monitored signal indicates that the system has crashed, the PIC triggers a shutdown/reset condition to protect the laser assembly.

PICfix2 is based on that same idea.

## What PICfix2 Changes

The original PICfix design connects the PIC output to the console reset/shutdown path through a resistor. That works, but the PIC output is still a driven signal connected to a sensitive console reset line. The resistor value has to be chosen carefully so the PIC can pull the line down when needed without holding the console in reset during normal operation.

PICfix2 changes the output stage.

Instead of relying on the PIC output and series resistor as the direct reset pull-down path, PICfix2 uses an external transistor stage to create a high-impedance, open-collector-style output.

### Original PICfix Output Concept

- PIC12C508 monitors the crash-detection signal.
- When a crash is detected, the PIC output activates.
- The PIC output pulls the console reset/shutdown line through a resistor.
- Resistor value is critical because the circuit is connected directly to the console reset line.

### PICfix2 Output Concept

- PIC12C508 keeps the same firmware and same monitoring behavior.
- The PIC output is inverted externally.
- When the PIC output becomes active-low, it turns on a PNP transistor.
- The PNP transistor turns on an NPN transistor.
- The NPN transistor sinks the console `/RST` line to ground.
- When inactive, the NPN is off and the `/RST` line sees a high-impedance connection.

This makes the PICfix2 output behave more like an open-collector reset switch.

## Main Design Goal

The main goal of PICfix2 is to avoid interfering with the PS2’s existing reset circuit.

On the affected PS2 boards, the reset line is already controlled by Sony’s supervisor/reset circuitry and the console controller logic. PICfix2 should only interact with that line when a valid laser-protection shutdown event is detected.

When PICfix2 is idle, it should stay out of the way.

When PICfix2 detects the same failure condition as the original PICfix, it should pull `/RST` low and force the console to shut down/reset.

## Design Intent

PICfix2 is intended to be:

- A drop-in conceptual replacement for the original PICfix output method.
- Compatible with the original PIC12C508 firmware.
- Electrically safer for the PS2 `/RST` line.
- High impedance when inactive.
- Open-collector-style when active.
- Simple enough for hobbyists and console modders to build.
- Focused only on laser protection, not extra features.

## What PICfix2 Is Not

PICfix2 is not intended to be a new modchip.

PICfix2 is not intended to bypass copy protection.

PICfix2 is not intended to change the behavior of the original Matrix PICfix firmware.

PICfix2 is not a full laser-driver protection system. A more advanced protection circuit could monitor the coil-drive signals directly, but that would be a more involved install and would move beyond the simple purpose of the original PICfix.

## Potentially Affected Consoles

PICfix and PICfix-style protection circuits are related to a MechaCon / DSP crash condition that can potentially affect non-DECKARD PlayStation 2 consoles.

Because of that, this project should not be limited only to a small list of tested board revisions. The better way to describe the scope is:

> Any non-DECKARD PS2 may potentially be affected, but the current PICfix-style solution does not work the same way on every board revision.

PICfix2 is being developed as an improvement to the original Matrix PICfix output method. Its first goal is to preserve the original PICfix purpose while making the reset-line interface safer and higher impedance.

## Board Revision Notes

| Unofficial Version | Common Model Range | Mainboard / Chassis Notes | PICfix2 Notes |
|---|---|---|---|
| v7 | SCPH-37000 / early SCPH-39000 series | GH-017 / GH-019 / G-chassis | Research / WIP — current PICfix method does not work as-is |
| v8 | SCPH-39000 series | GH-022 / G-chassis | Research / WIP — current PICfix method does not work as-is |
| v9 | SCPH-50000 series | GH-023 / H-chassis | Known PICfix-style target |
| v10 | SCPH-50000 series | GH-026 / I-chassis | Known PICfix-style target |
| v11 | SCPH-50000 series | GH-029 / J-chassis | Known PICfix-style target |
| v12 | SCPH-70000 series | GH-032 / GH-035 / K-chassis | Original Matrix PICfix target |
| v13 | SCPH-70000 series | GH-032 / GH-035 / K-chassis | Known PICfix-style target |

Board revisions and install points may vary. Always verify the exact motherboard revision before installing.

Some model numbers can share similar shells while using different motherboard revisions, so the motherboard revision should be trusted more than the outer case model number.

### Important Note About v7 / v8 Boards

v7 and v8 boards appear to behave differently than the later PICfix-compatible boards. These revisions use a SysControl-style reset/control arrangement, and the current Matrix PICfix method does not work on them as-is.

Because of this, v7 and v8 should be considered research-in-progress for this project.

A separate solution is being investigated for these boards. The long-term goal is to develop a more universal protection approach that could eventually be used across affected non-DECKARD PS2 consoles, including PS2 Slim models, while still keeping the original purpose of PICfix:

> Protect the laser assembly from crash-related tracking/focus coil damage.

## Hardware Concept

PICfix2 uses the original PICfix logic with a revised reset-driver stage.

Basic signal flow:

```text
Original monitored signal
        |
        v
PIC12C508 running Matrix PICfix firmware
        |
        v
Active-low PIC output
        |
        v
PNP inverter / driver
        |
        v
NPN open-collector-style reset pull-down
        |
        v
PS2 /RST line pulled to GND only during fault condition
