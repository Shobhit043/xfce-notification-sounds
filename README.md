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
    git clone https://github.com/Shobhit043/xfce-notification-sounds.git
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
    
5. **Set/Edit paths in battery_monitor and volume_notify scripts to appropriate location where your sound files are present**

## Set Up
Once all the files are made executable and sound files stored in your directory of choice we can move forward and set up scripts startup.<br>
**Please note that there are 3 scripts and all of them would be added to session and startup in same fashion and i want only demonstrate it for single script**

1. Search for **session and startup** in your search bar and open it
2. The window would look like this: <br><br>
   ![can't display screenshot](https://raw.githubusercontent.com/Shobhit043/xfce-notification-sounds/main/screenshots/session%20and%20startups.png)<br>

3. Click on **Add** option which would option this type of window: <br><br>
   ![can't display screenshot](https://raw.githubusercontent.com/Shobhit043/xfce-notification-sounds/main/screenshots/application%20window.png)<br>

4. Fill the application name and discription and after filling, it would look like this: <br><br>
   ![can't display screenshot](https://raw.githubusercontent.com/Shobhit043/xfce-notification-sounds/main/screenshots/appication%20window(with%20info).png)<br>
5. Click on command upload button and from the upload window locate and select the script which you want to add for example battery_monitor.sh <br><br>
   ![can't display screenshot](https://raw.githubusercontent.com/Shobhit043/xfce-notification-sounds/main/screenshots/command%20upload%20window.png)<br>

6. Set **Trigger** to **log in** <br>
   **Note** - when setting the killing script set **Trigger** to log out because we would want to close these applications/scripts whenever use log out and prevent multiple stratup of these scripts at each log in  <br><br>

7. Click on **OK**. <br><br>

## To start applications
After you have added all 3 scripts to startup and session to start the appilcations you would just need to **log out** and then **log in** again or you can also reboot.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any changes or additions.
