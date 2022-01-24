# Yet Another Makefile Blog

## Introduction

This repo uses a Makefile which generates a static HTML blog from Markdown files, based on a .html and .css template.
It utilises the power of pandoc and also uses a script to generate a chronologically ordered index of blog posts.

## Quickstart

```bash
git clone https://github.com/akiyamn/yamb.git
cd yamb
echo -e "# My example\nThis is my example blog entry" > example.md
echo -e "# My second example\nThis is my other example blog entry" > example2.md
make
```

`example.html`, `example2.html` as well as `index.html` will be generated in the same directory.


## Prerequisits
You must be using a Unix-like operating system such as: GNU/Linux, BSD, MacOS; or an environment like WSL on Windows to use these scripts.

### Required
- GNU Make
- Pandoc

### Optional
- scp (for automatic upload to your web server on build)


## Installation
To install this set of scripts, firstly install the prerequist programs.

For example:

|Distro|Command|
|-|-|
|**Debian/Ubuntu**|`sudo apt install make pandoc scp`|
|**Fedora/CentOS/RHEL** |`sudo dnf install make pandoc scp`|
|**Arch Linux**| `sudo pacman -S make pandoc scp`|

Then clone the repo to a desired location:

```bash
git clone https://github.com/akiyamn/yamb.git
cd yamb
```

*Remember to delete this Markdown file unless you want it in your blog!*

## Usage

To generate a blog from some markdown files, firstly create at least one markdown file to convert into a blog entry. For example, save the following snippet as `example.md`.

```md
---
title: I like Markdown
author: Me
date: Today
---

# Why markdown is cool
It just is.
```

Then, while in the root directory of the project (i.e. the `yamb` directory), run:
```bash
make
```

The script will generate a HTML page from the Markdown file, as well as a chronologically sorted index saved as `index.css`.

## Command list
|Command|Description|
|-|-|
|`make`|Generate a static blog and index from Markdown (same as `make all index` by default)|
|`make clean`|Delete all generated `.html` files|
|`make upload`|Upload HTML files to remote server using `scp` (See [here](#uploading-with-scp))|
|`make index`|Generate only the index as a Markdown file|
|`make all`|Only generate HTML from Markdown without creating an index|

## Extra features
The script uses Pandoc for the heavy lifting of converting the Markdown, so all of Pandoc features can be utilised. In theory you could convert from any two document formats supported by Pandoc. Such as ODT or Org-mode.

### KaTeX equasions
The use of KaTeX requires a KaTeX installation directory on the server you are deploying to.

Uncomment the line in the `Makefile` which lists `--katex` as one of the arguments to Pandoc, while commenting the original line. Replace the provided dummy URL to the one that points to your KaTeX install directory.

### Uploading with SCP
This requires SSH connectivity to your web server.
Enter your server's remote URL, port and web server directory into the Makefile in the location which looks like:
```bash
REMOTE = user@yourdomain 
REMOTE_DIR = /var/www/html
PORT = 22
```

You can uncomment the `.PHONY` line with `upload` listed if you would like uploading to the remote server to be the default behaviour. Otherwise, just use `make upload`