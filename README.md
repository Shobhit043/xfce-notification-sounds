# xfce-notification-sounds

This repository contains notification sound files and shell scripts for various system notifications and utilities on XFCE.

## Repository Structure

- **notification sounds/**: This folder contains audio files used for system notifications.
  - `audio-volume-change.oga`
  - `battery-is-completely-dead.mp3`
  - `complete.oga`
  - `power-plug.oga`
  - `power-unplug.oga`

- **shell scripts/**: This folder contains shell scripts for monitoring and notifications.
  - `battery_monitor`
  - `volume_notify`
  - `killing-script`

## Installation

Follow these steps to set up the repository and make all shell scripts executable:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/yourusername/xfce-notification-sounds.git
    cd xfce-notification-sounds
    ```

2. **Navigate to the shell scripts directory**:

    ```bash
    cd shell\ scripts
    ```

3. **Make all shell scripts executable**:

    ```bash
    chmod +x battery_monitor volume_notify killing-script
    ```

4. **Move the sound files to the appropriate directory (if needed)**:

    ```bash
    mv ../notification\ sounds/* /path/to/your/sound/directory/
    ```

5. **Run the scripts as needed**:

    ```bash
    ./battery_monitor
    ./volume_notify
    ./killing-script
    ```

## Usage

- **`battery_monitor`**: Monitors the battery status and plays a notification sound when the battery is low or fully charged and if charger is plugged or unplugged.
- **`volume_notify`**: Plays a sound notification when the system volume changes.
- **`killing-script`**: Utility script for managing processes.

Feel free to modify the scripts according to your needs.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes or additions.
