# Downzone [![License: Non-Commercial](https://img.shields.io/badge/License-NonCommercial-blue.svg)](LICENSE) [![License: Commercial](https://img.shields.io/badge/License-Commercial-red.svg)](LICENSE)

**Downzone** is a command-line downloader designed for macOS and Linux that allows you to schedule and manage downloads with ease. It features:

- Dynamic timezone selection
- Custom start and end times
- Sequential downloads from a list of URLs
- Resume support for interrupted downloads
- Retry mechanism for failed downloads
- Colored and informative messages (Info, Success, Warning, Error)
- Interactive validation of links file
- Progress display for each download

---

## Features

1. **Timezone Selection:** Choose your timezone from a predefined list before starting downloads.  
2. **Start & End Time:** Set the download window dynamically; the script will wait until the start time and stop automatically at the end time.  
3. **Links File:** Provide a text file (`links.txt`) containing all URLs to download. The script validates the file path interactively.  
4. **Resume & Retry:** Downloads are resumable and will retry up to 3 times if a failure occurs.  
5. **Progress & Messages:** Download progress is shown in the terminal along with colored status messages.  
6. **Safe Execution:** The script will **never stop** due to individual download failures and will continue to the next link.  

---

## Installation

1. **Clone or download the repository:**

```bash
git clone https://github.com/YOUR_USERNAME/downzone-package.git
cd downzone-package
```

2. **Run installer:**

```bash
sudo ./install.sh
```

## Usage

**Run the command:**

```bash
downzone
```

### The script will prompt you for:

1. Timezone selection – Choose from a list.
2. Links file path – Enter the full path to your links.txt. The script will verify the file exists.
3. Start and end times – Enter the download window in HH:MM format.
#
The script will then begin downloading all links sequentially into your ~/Downloads folder. It will show download progress, retries for failed links, and colored messages for all operations.

### Links File Format

- The file format must be txt.
- One URL per line
+ Lines starting with # are treated as comments and ignored
**Example:**

```txt
# My download links
https://example.com/file1.zip
https://example.com/file2.mp4
```

### Uninstallation

To remove the installed command:

```bash
sudo rm /usr/local/bin/downzone
```

### Notes

- Works on macOS and most Linux distributions.
- Requires curl to be installed.
- The script is designed to be robust: it will continue even if some downloads fail.
- All downloaded files are saved to your Downloads folder by default.

### License

Downzone is distributed under a Dual License:


1) Non-Commercial / Personal Use

- Free for personal, educational, or non-commercial purposes.
- You may use, copy, modify, and distribute the software only for non-commercial purposes.
- You must keep this LICENSE file and copyright notice intact.
- Commercial use is not allowed under this license.



2) Commercial / Paid Use
- Commercial use is any usage where the software is sold or used in a paid product/service.
- You must obtain a Commercial License from the copyright holder: `miladpersonal1999@gmail.com`

- Once obtained, you are allowed to distribute or include Downzone in a commercial product according to the commercial license.


### Disclaimer
This software is provided "AS IS", without warranty of any kind. The author is not responsible for any damage or loss arising from the use of this software.


### Contributing

Feel free to fork the repository, submit issues, or create pull requests for personal or non-commercial use. Make sure to keep the script executable permissions intact.  

**Note:** Commercial use of this software requires a separate license. Contact the copyright holder at `miladpersonal1999@gmail.com` for commercial licensing.


### License
This project is licensed under a Dual License:

- **Non-Commercial / Personal Use:** Free to use, modify, and distribute for personal or non-commercial purposes.  
- **Commercial Use:** Requires a separate commercial license. Contact `miladpersonal1999@gmail.com` to obtain a license.
